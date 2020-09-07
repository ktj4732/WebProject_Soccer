package com.test.soccer.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/clubmanagementfriendlymatchrecruitmanagementacceptok.do")
public class clubmanagementFriendlyMatchRecruitManagementAcceptOK extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String apply_seq = req.getParameter("apply_seq");
		
		ClubManagementMatchDAO dao = new ClubManagementMatchDAO();
		
		int result =0;
		
		result = dao.accept(apply_seq);
		

		// 3.결과처리
		if (result == 1) {
			// 수정 성공
			resp.sendRedirect("/soccer/board/clubmanagementfriendlymatchrecruitmanagement.do");

		} else if (result == 0 ) {
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
