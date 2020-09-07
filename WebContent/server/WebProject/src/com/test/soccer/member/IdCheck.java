package com.test.soccer.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/idCheck.do")
public class IdCheck extends HttpServlet{
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(id)
		//2. DB 작업 -> select
		//3. 결과 반환
		
		//1.
		String idCheck = req.getParameter("id");
		//2.
		AjaxDAO dao = new AjaxDAO();
		int resultCheck = dao.check(idCheck); //1,0
		
		//3.
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("{");
		writer.printf("\"use\": %d", resultCheck); //{ "use": 1 }
		writer.print("}");
		writer.close();
	}
	
}
