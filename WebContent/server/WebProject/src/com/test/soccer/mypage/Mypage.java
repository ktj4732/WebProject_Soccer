package com.test.soccer.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/mypage/mypage.do")
public class Mypage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//세션 얻어오기
		HttpSession session = req.getSession();
		String seq = (String) session.getAttribute("seq");
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		String pic = (String) session.getAttribute("pic");

		// 작업 위임 
		
		MypageDAO dao = new MypageDAO();
//		
//		MypageDTO dto = new MypageDTO();
//		DmDTO dto2 = new DmDTO();
//		LeagueDTO dto3 = new LeagueDTO();
//		RankDTO dto4 = new RankDTO();
//		
		//회원정보
		ArrayList<MypageDTO> list = dao.list(seq);
		
		//dm목록보기
		ArrayList<DmDTO> dmlist = dao.dmlist(seq);
		
		//리그일정보기
		ArrayList<LeagueDTO> leaguelist = dao.leaguelist(seq);
		
		//개인기록
		RankDTO dto = dao.ranklist(seq);
		

		System.out.println(leaguelist);

		//데이터 반환하기
		req.setAttribute("list", list);
		req.setAttribute("dmlist", dmlist);
		req.setAttribute("seq", seq);
		req.setAttribute("leaguelist", leaguelist);
		req.setAttribute("dto", dto);
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");
	dispatcher.forward(req, resp);
	
	}
}
