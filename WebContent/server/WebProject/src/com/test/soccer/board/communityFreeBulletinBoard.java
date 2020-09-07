package com.test.soccer.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/communityFreeBulletinBoard.do")
public class communityFreeBulletinBoard extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB작업 > select
		//2. 결과값 전달 + JSP 호출하기
		
		//세션 얻어오기
		HttpSession session = req.getSession();
		
		//검색어 받아오기
		String search = req.getParameter("search");

		//한페이지 당 출력 갯수 받아오기
		String selectrow= req.getParameter("selectrow");
		
		//검색 방법 받아오기
		String selectKeyword = req.getParameter("selectKeyword");
		
		//한페이지 당 출력 갯수 초기값이 null이라 10으로 default
		if(selectrow == null) {
			selectrow = 10+"";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();		
		
		//검색어 담기
		map.put("search", search);
		//카테고리 3 = 자유게시판
		map.put("category","3");
		//검색 방법 선택
		map.put("selectKeyword", selectKeyword);
		
		//페이징 처리 관련 변수
		int nowPage = 0;								//현재 페이지 번호
		int totalCount = 0;								//총 게시물 수
		int pageSize = Integer.parseInt(selectrow);		//한페이지 당 출력 갯수
		int totalPage = 0;								//총 페이지 수
		int begin = 0;									//rnum 시작 번호
		int end = 0;									//rnum 끝 번호
		int n = 0;										//페이지바 관련 변수
		int loop = 0;									//페이지바 관련 변수
		int blockSize = 10;								//페이지바 관련 변수
		
		//클릭한 페이지 받아오기
		String page = req.getParameter("page");
		
		if(page == null || page == "") nowPage = 1; //default
		else nowPage = Integer.parseInt(page); //보고싶은 페이지
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
	
		//1.
		BoardDAO dao = new BoardDAO();
		
		//총 페이지 수 계산하기
		
		//총 게시물
		totalCount = dao.getTotalCount(map);
		//총페이지수 = 총 게시물 수 / 한 페이지당 출력 게시물 수
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		//전체 목록이 list에 담겨져 있다.
		//map(search) 매개 변수를 넣어줌
		ArrayList<BoardDTO> list = dao.list(map);
		
		//1.5 
		Calendar now = Calendar.getInstance();
		
		//##작성시간##
		//오늘 쓴 글 구분하기
		for (BoardDTO dto : list) {
			
			//오늘 날짜 일때
			if (dto.getRegdate().startsWith(String.format("%tF", now))) {
				//시간만 출력
				dto.setRegdate(dto.getRegdate().substring(11));
			//오늘 날짜가 아닐때
			} else {
				//날짜만 출력
				dto.setRegdate(dto.getRegdate().substring(0, 10));
			}
		//##검색어 부각##
		if (search != null && search != "") {
			
			String tomato = "";			
						
			if(selectKeyword.equals("title")) { //제목 검색일때 				
				tomato = dto.getTitle();
				tomato = tomato.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
				dto.setTitle(tomato);
			} else if(selectKeyword.equals("name")) { //글쓴이 검색일때
				tomato = dto.getName();
				tomato = tomato.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
				dto.setName(tomato);
			} 	else if(selectKeyword.equals("title_content")) { //제목+내용 검색일때
				tomato = dto.getTitle();				
				tomato = tomato.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");				
				dto.setTitle(tomato);				
			} 
			
			
		}
		
				
		}//for
		
		//새로고침 조회수 증가 방지
		session.setAttribute("read", false);		
		
		//페이지 제작
		loop = 1; //평범한 루프		
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //출발 값
		
		String pagebar = "";
		
		pagebar += "<nav class=\"pagebar\" style=\"float: right\">";
		pagebar += "<ul class=\"pagination\">";
				
		//이전 10페이지
		if (n == 1) {
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Previo"
					+ "xus\">";
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			if (search == null) {
			pagebar += String.format("<a href=\"/soccer/board/communityFreeBulletinBoard.do?page=%d&selectrow=%s\" aria-label=\"Previous\">", n - 1, selectrow);
			} else {
			pagebar += String.format("<a href=\"/soccer/board/communityFreeBulletinBoard.do?page=%d&selectKeyword=%s&search=%s&selectrow=%s\" aria-label=\"Previous\">", n - 1, selectKeyword, search, selectrow);				
			}			
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
		
		//for (int i=1; i<=totalPage; i++) {
		while(!(loop > blockSize || n > totalPage)) { //n > totalPage 18페이지 까진데 19 20 은 x
			//페이지 번호
			if (n == nowPage) {
				pagebar += "<li class='active'>";
				pagebar += String.format("<a href=\"#!\">%d</a>", n); //#! 의미없는 링크를 만들떄, 현재페이지는 클릭안되게
				pagebar += "</li>";	
			
			} else {				
				pagebar += "<li>";
				if (search == null) {
				pagebar += String.format("<a href=\"/soccer/board/communityFreeBulletinBoard.do?page=%d&selectrow=%s\">%d</a>", n, selectrow, n);
				} else {
				pagebar += String.format("<a href=\"/soccer/board/communityFreeBulletinBoard.do?page=%d&selectKeyword=%s&search=%s&selectrow=%s\">%d</a>", n, selectKeyword, search, selectrow, n);
				}
				pagebar += "</li>";	
			}
			loop++;
			n++;
		}
		
		//다음 10페이지
		if (n > totalPage) {
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Next\">";
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";			
			if (search == null) {
			pagebar += String.format("<a href=\"/soccer/board/communityFreeBulletinBoard.do?page=%d&selectrow=%s\" aria-label=\"Next\">", n, selectrow);
			} else {
			pagebar += String.format("<a href=\"/soccer/board/communityFreeBulletinBoard.do?page=%d&selectKeyword=%s&search=%s&selectrow=%s\" aria-label=\"Next\">", n, selectKeyword, search, selectrow);																	
			}
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
		
		pagebar += "</ul>";		
		pagebar += "</nav>";
		
		//카테고리 번호
		BoardDTO dto = new BoardDTO();
		dto.setCategory_seq("3");
		
		
		//2.
		//목록
		req.setAttribute("list", list);
		//검색어
		req.setAttribute("search", search);
		//페이지
		//page 값이 null이면 1페이지
		if(page==null || page=="") page="1"; 
		req.setAttribute("page", page);
		
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("pagebar", pagebar);
		
		//한페이지 당 출력 갯수		
		req.setAttribute("selectrow", selectrow);
				
		//검색 방법
		req.setAttribute("selectKeyword", selectKeyword);
	
//		카테고리 번호때문에..
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/communityFreeBulletinBoard.jsp");
		dispatcher.forward(req, resp);
		
	}

}