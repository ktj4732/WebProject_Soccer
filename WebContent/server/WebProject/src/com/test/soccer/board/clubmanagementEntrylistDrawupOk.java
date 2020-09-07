package com.test.soccer.board;

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

import com.test.soccer.member.AjaxDAO;


@WebServlet("/board/clubmanagementEntrylistDrawupOk.do")
public class clubmanagementEntrylistDrawupOk extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기
		//2. DB작업
		//3. 결과 반환

		//1.
		String seq = req.getParameter("seq"); 
		String position_x = req.getParameter("position_x");
		String position_y = req.getParameter("position_y");
//		String playerentry
		//2.
		AjaxDAO dao = new AjaxDAO();

		
		formationDTO dto = new formationDTO();
		
		dto.setSeq(seq);
		dto.setPosition_x(position_x);
		dto.setPosition_y(position_y);
		
		int result = dao.editFormation(dto);
		
		
		//3.
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
		
	}

}
