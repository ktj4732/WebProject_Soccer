package com.test.soccer.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/memberdelete.do")
public class MemberDelete extends HttpServlet{


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	

	RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/mypage.jsp");
	dispatcher.forward(req, resp);
	
	
	
	}
	
}
