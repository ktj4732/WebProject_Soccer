package com.test.soccer.analysis;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.soccer.member.MemberDAO;
import com.test.soccer.member.MemberDTO;


@WebServlet("/analysis/playerAnalysis.do")
public class PlayerAnalysis extends HttpServlet{
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberDTO> list = dao.getData();
		
		req.setAttribute("list", list);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/analysis/playerAnalysis.jsp");
		
		dispatcher.forward(req, resp);	
	}
	
}

