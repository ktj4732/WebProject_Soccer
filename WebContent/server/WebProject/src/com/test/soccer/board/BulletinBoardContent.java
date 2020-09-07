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

@WebServlet("/board/BulletinBoardContent.do")
public class BulletinBoardContent extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기
		//2. DB 작업
		//3. 결과 반환
		
		//세션 얻어오기
		HttpSession session = req.getSession();
		
		//1.		
		String seq = req.getParameter("seq");						//게시판 번호
		String search = req.getParameter("search");					//검색어
		String page = req.getParameter("page");						//페이지
		String selectKeyword = req.getParameter("selectKeyword");	//검색방
		String selectrow = req.getParameter("selectrow");			//검색 출력 갯수
		
		String category_seq = req.getParameter("category_seq");		//카테고리 번호

		//처음에 아무것도 검색안하고 게시물을 보고 목록 버튼을 누르면 NullPointerException 오류가 떠서 초기값으로 title을 임의로 줬음
		if(selectKeyword == "") {
			selectKeyword = "title";
		}
		
		//2.
		BoardDAO dao = new BoardDAO();
				
		//북마크 할경우 -> session.getAttribute("read") == null
		if(session.getAttribute("read") == null || (boolean)session.getAttribute("read") == false ) {
		
			//조회수 증가
			dao.updateReadCount(seq);
		
			session.setAttribute("read", true);			
		}	
		
		BoardDTO dto2 = new BoardDTO();			
		dto2.setSeq(seq);
		dto2.setMember_seq((String)session.getAttribute("seq"));
		
		//내용
		BoardDTO dto = dao.content(dto2);
		
		//a. 개행 문자 처리
		String content = dto.getContent();
		content = content.replace("\r\n", "<br>");
		dto.setContent(content);
		
		//&& selectKeyword == "title_content"
		//b. 검색어 부각시키기
		
		//검색어가 있고 또는 빈문자가 아니고 && 내용 검색 또는 (제목+내용)검색
		if((search != null || search != "") && (selectKeyword.equals("content") || selectKeyword.equals("title_content"))) {
						
			content = content.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
			dto.setContent(content);
			
		}
		
		//내용 보내기
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		req.setAttribute("page", page);
		req.setAttribute("selectKeyword", selectKeyword);
		req.setAttribute("selectrow", selectrow);
		
		req.setAttribute("category_seq", category_seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/BulletinBoardContent.jsp");
		dispatcher.forward(req, resp);
		
	}

}
