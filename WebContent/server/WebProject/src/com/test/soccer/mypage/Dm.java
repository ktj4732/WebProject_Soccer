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

@WebServlet("/mypage/dm.do")
public class Dm extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String seq = (String)session.getAttribute("seq");
		
		//2. 친구 목록과 채팅 목록 가져오기
		MypageDAO dao = new MypageDAO();
		
		ArrayList<FriendsDTO> friends = dao.followingList(seq);
		ArrayList<DmDTO> dm = dao.dmlist(seq);
		
		
		req.setAttribute("friends", friends);
		req.setAttribute("dm", dm);
		
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/dm.jsp");
	dispatcher.forward(req, resp);
	}
	
}
