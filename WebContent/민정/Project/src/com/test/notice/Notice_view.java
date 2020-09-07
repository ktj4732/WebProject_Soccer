package com.test.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/notice_view.do")
public class Notice_view extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq)
		//2. DB작업 -> select
		//3. 결과 봔환 + JSP 호출하기
		
		HttpSession session  = req.getSession();
		
		//1. view.do?seq=1
		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		String sort = req.getParameter("sort");	//상태 유지
		
		//2. DB 담당자에게 위임
		// - 글번호 전달하고 레코드 1개(BoardDTO) 반환받기
		BoardDAO dao = new BoardDAO();
		
//		if(session.getAttribute("read") == null || (boolean)session.getAttribute("read")==false) {
//			//2.3 조회수 증가
//			dao.updateReadcount(seq);
//			
//			session.setAttribute("read", true);
//		}
		
		BoardDTO dto2 = new BoardDTO();
		dto2.setSeq(seq);
//		dto2.setAdmin_seq((String)session.getAttribute("seq"));
		
		BoardDTO dto = dao.get(dto2);
		
		//2.5 데이터 가공
		//a. 개행 문자 처리
//		String content = dto.getContent();
//		content = content.replace("/r/n", "<br>");
//		dto.setContent(content);
		
		//b. 검색어 부각시키기
//		if(search != null && search != "") {
//			content = content.replace(search, "<span style = 'font-weight:bold; color: tomato;'>" + search + "</span>");
//			dto.setContent(content); 
//		}
		
		//3. BoardDAO에게 반환받은 BoardDTO(게시글 1개)를 출력하기 위해서 JSP 페이지에게 전달
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		req.setAttribute("sort", sort);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/view.jsp");
		dispatcher.forward(req, resp);
		
		
	}
}
