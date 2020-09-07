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

@WebServlet("/mypage/friends.do")
public class Friends extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String seq = (String) session.getAttribute("seq");
		
		// 작업 위임
		MypageDAO dao = new MypageDAO();
				
		ArrayList<FriendsDTO> followerList = dao.followerList(seq);
		ArrayList<FriendsDTO> followingList = dao.followingList(seq);
			
		req.setAttribute("followerList", followerList);
		req.setAttribute("followingList", followingList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/friends.jsp");
		dispatcher.forward(req, resp);
		
	}
}
