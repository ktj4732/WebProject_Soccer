package com.test.soccer.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/edit.do")
public class Edit extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기
		//2. DB 작업
		//3. 결과 반환
		
		//1. 수정할 글번호 가져오기
		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		String selectKeyword = req.getParameter("selectKeyword");
		String selectrow = req.getParameter("selectrow");
	
		String category_seq = req.getParameter("category_seq");
		
		//2. 글번호로 글내용 가져오기
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto2 = new BoardDTO();
		dto2.setSeq(seq);
		dto2.setSearch(search);
		dto2.setSelectKeyword(selectKeyword);
		dto2.setSelectrow(selectrow);
		dto2.setCategory_seq(category_seq);
			
		
		BoardDTO dto = dao.content(dto2);
		
		//3.
		req.setAttribute("dto", dto);
		
		//상태 유지 필요해서..
		req.setAttribute("dto2", dto2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/edit.jsp");
		dispatcher.forward(req, resp);
		
	}

}
