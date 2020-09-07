package com.test.soccer.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/friendlymatchapplyok.do")
public class FriendlyMatchApplyOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	//신청하기 버튼에서 넘겨받은 정보를 친선경기 신청 테이블에 인서트 해준다. 
	//인서트할 정보 팀, 시간
	String seq = req.getParameter("login_seq");
	String board_seq = req.getParameter("seq");
	

	BoardDAO2 dao = new BoardDAO2();
	
	
	int result = 0;
	result = dao.apply(seq, board_seq);
	
	// 3.결과처리
			if (result == 1) {
				// 신청성공
//				System.out.println("성공");
				resp.sendRedirect("/soccer/board/friendlymatchrecruit.do");

			} else if (result == 0) {
				// 수정 실패
				PrintWriter writer = resp.getWriter();
				writer.print("<html>");
				writer.print("<body>");
				writer.print("<script>");
//				writer.print("alert('failed'); history.back();");
				writer.print("</script>");
				writer.print("</body>");
				writer.print("</html>");
			}
		}
	
	
}
