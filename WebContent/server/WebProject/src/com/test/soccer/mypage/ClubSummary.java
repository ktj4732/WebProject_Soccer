package com.test.soccer.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/clubsummary.do")
public class ClubSummary extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1.데이터 얻어오기
		HttpSession session = req.getSession();
		String seq = (String)session.getAttribute("seq");
		
		//2.위임하기
		MypageDAO dao = new MypageDAO();
		//소속구단의 경기 전적 가져오기
		ArrayList<LeagueDTO> matchResult = dao.matchResult(seq);
		//이적내역 가져오기
		ArrayList<LeagueDTO> transfer = dao.transfer(seq);
		//소속구단의 친선경기순위/리그 순위
//		LeagueDTO dto = dao.teamrank(seq);
		
		
		
		
		
		
		req.setAttribute("matchResult", matchResult);
		req.setAttribute("transfer", transfer);
//		req.setAttribute("dto", dto);
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/clubsummary.jsp");
	dispatcher.forward(req, resp);
	
	}
	
}
