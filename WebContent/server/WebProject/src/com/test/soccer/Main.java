package com.test.soccer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.soccer.member.TeamDAO;
import com.test.soccer.member.TeamDTO;


@WebServlet("/main.do")
public class Main extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TeamDAO dao = new TeamDAO();
		
		//경기일정 리스트
		ArrayList<TeamDTO> scheduleList = dao.getscheduleList();
		
		//팀순위 리스트
		ArrayList<TeamDTO> list = dao.getTeamRank();
		
		//개인순위(골) 리스트
		ArrayList<TeamDTO> goalRank = dao.getGoalRank();
		
		//개인순위(도움) 리스트
		ArrayList<TeamDTO> assistRank = dao.getAssistRank();
		
		//개인순위(태클성공) 리스트
		ArrayList<TeamDTO> tackleRank = dao.getTackleRank();
		
		//개인순위(세이브) 리스트
		ArrayList<TeamDTO> saveRank = dao.getSaveRank();
		
		//개인순위(경고누적) 리스트
		ArrayList<TeamDTO> yellowRank = dao.getYellowRank();
		
		//개인순위(파울누적) 리스트
		ArrayList<TeamDTO> foulRank = dao.getFoulRank();
		
		req.setAttribute("list", list);
		req.setAttribute("goalRank", goalRank);
		req.setAttribute("assistRank", assistRank);
		req.setAttribute("tackleRank", tackleRank);
		req.setAttribute("saveRank", saveRank);
		req.setAttribute("yellowRank", yellowRank);
		req.setAttribute("foulRank", foulRank);
		req.setAttribute("scheduleList", scheduleList);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/main.jsp");
		dispatcher.forward(req, resp);	
	}
	
}

