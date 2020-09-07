package com.test.soccer.team;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/team/teamplayerinformation.do")
public class TeamPlayerInformation extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/team/teamplayerinformation.jsp");
		dispatcher.forward(req, resp);
	}//doget
}//teamplayerinformation
