package com.test.soccer.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/mypageinfoupdate.do")
public class MypageInfoUpdate extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session = req.getSession();
		
	//수정할 seq 세션에 저장되어있음
	String seq = (String)session.getAttribute("seq");
	//회원 번호로 회원정보 가져오기
	MypageDAO dao = new MypageDAO();
	MypageDTO dto2 = new MypageDTO();
	dto2.setSeq(seq);
	
	MypageDTO dto = dao.getInfo(dto2);
		
	
	req.setAttribute("dto", dto);
	
	
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/mypageinfoupdate.jsp");
	dispatcher.forward(req, resp);
	
	
	}
}
