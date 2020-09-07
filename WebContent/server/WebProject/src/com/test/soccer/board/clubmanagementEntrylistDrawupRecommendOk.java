package com.test.soccer.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.soccer.member.AjaxDAO;

@WebServlet("/board/clubmanagementEntrylistDrawupRecommendOk.do")
public class clubmanagementEntrylistDrawupRecommendOk extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1. 데이터 가져오기
		//2. DB 작업
		
		String entry_seq = req.getParameter("entry_seq");
		String formation_seq = req.getParameter("formation_seq");
		
		
		formationDTO dto = new formationDTO();
		dto.setEntry_seq(entry_seq);
		dto.setSeq(formation_seq);
		
		
		AjaxDAO dao = new AjaxDAO();
		
		dao.editFormation_seq(dto);
		
		
	}

}