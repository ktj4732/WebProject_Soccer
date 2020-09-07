package com.test.soccer.schedule;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/schedule/leagueresult.do")
public class LeagueResult extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
		
		
	LeagueResultDAO dao = new LeagueResultDAO();
	ArrayList<LeagueResultDTO> dto = dao.result();
	
	
		
		
		
		
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/schedule/leagueresult.jsp");
	dispatcher.forward(req, resp);
	}
	
	
}
