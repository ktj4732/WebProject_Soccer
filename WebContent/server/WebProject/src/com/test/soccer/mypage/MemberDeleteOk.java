package com.test.soccer.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/memberdeleteok.do")
public class MemberDeleteOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1.데이터 가져오기
		//2.db작업 -> delete
		//3.결과처리
		
		//1. 
		HttpSession session = req.getSession();
		String seq = (String)session.getAttribute("seq");
		
		//2. 
		MypageDAO dao = new MypageDAO();
		MypageDTO dto = new MypageDTO();

		
		int result = 0;
		
		dto.setSeq(seq);
		
				
		result = dao.memberDelete(dto); 
				
		// 3.결과처리
				if (result == 1) {
					// 삭제성공
					resp.sendRedirect("/soccer/mypage/mypage.do");

				} else if (result == 0) {
					// 수정 실패
					PrintWriter writer = resp.getWriter();
					writer.print("<html>");
					writer.print("<body>");
					writer.print("<script>");
					writer.print("alert('failed'); history.back();");
					writer.print("</script>");
					writer.print("</body>");
					writer.print("</html>");
				}
				
	
	
	}
}
