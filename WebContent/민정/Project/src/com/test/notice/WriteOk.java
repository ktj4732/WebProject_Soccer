package com.test.notice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/writeok.do")
public class WriteOk extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8"); //받아오는 값들을 한글로 인코딩합니다.

		String title = req.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
		String content = req.getParameter("content");//write.jsp에서 content에 입력한 데이터값
		String file = req.getParameter("file"); //write.jsp에서 file에 입력한 데이터값
		/*글쓴 관리자 번호 가져오기!*/
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setTitle(title);
		dto.setContent(content);
		//dto.setFile(file);
		//dto.setAdmin_seq(admin_seq);
		
		int result = dao.write(dto);
		dao.close();
		
		if(result == 1) {
			//글쓰기 성공 -> 게시판 목록 보기로 이동
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("<alert('등록이 완료되었습니다!');>");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("<html>");
			
			resp.sendRedirect("/soccer/notice.do");
			System.out.println("성공");
		}else
		{
			System.out.println("글쓰기 실패");
		}



		
	}
}
