package com.test.notice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/notice.do")
public class Notice extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("Notice.java");
		
		HttpSession session = req.getSession();
		
		//목록 or 검색
		// - 목록 : notice.do
		// - 검색 : notice.do?search=???
		String search = req.getParameter("search");
		String searchKeyWord = req.getParameter("searchKeyWord");
		
		// 정렬기준
		// - list.do -> seq(thread)
		// - list.do?sort=seq
		// - list.do?sort=heart
		// - list.do?sort = readcount
		
		String sort = req.getParameter("sort");
		
		if(sort == null || sort == "") {
			sort = "seq";	//기본값	
		}
		
		if(searchKeyWord == "name") {
			searchKeyWord = "name";
		}
		
		if(searchKeyWord == "title") {
			searchKeyWord ="title";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("sort",sort);
		map.put("searchKeyWord",searchKeyWord);
		
		
		//***페이징 처리 관련 변수
		int nowPage = 0;			//현재 페이지 번호
		int totalCount = 0;			// 총 게시물 수
		int pageSize = 10;			// 한 페이지 당 출력 개수
		int totalPage = 0;			// 총 페이지 수
		int begin = 0;				// rnum 시작 번호
		int end = 0;				// rnum 끝 번호
		int n = 0;					// 페이지바 관련 변수
		int loop = 0;				// 페이지바 관련 변수
		int blockSize = 10;			// 페이지바 관련 변수
		
		//list.do -> list.do?page = 1 변경
		//list.do?page=3
		
		String page = req.getParameter("page");
		
		if(page == null || page == "") nowPage = 1;	//default -> 1
		else nowPage = Integer.parseInt(page);
		
		
		//nowPage -> 보려는 페이지 번호
		//1page -> where rnum >=1 and rnum <=10
		//2page -> where rnum >=11 and rnum <=20...
		
		begin = ((nowPage-1)*pageSize)+1;
		end = begin + pageSize - 1;
		
		map.put("begin",begin+"");
		map.put("end", end+"");
		
		
		//1. DB 작업 > select
		BoardDAO dao = new BoardDAO();
		
		//총 페이지 수 계산하기
		// 총 페이지 수 = 총 게시물 수 / 한페이지당 출력 게시물 수
		// ? = 175/10 -> 17.5 >> 18
		totalCount = dao.getTotalCount(map);
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		System.out.println(totalPage);
		
		ArrayList<BoardDTO> list = dao.list(map);
		
		//list: 게시판 목록 원본
		// -> list 가공
		
		//데이터 가공 시점
		// - 최소 규칙: 최대한 빨리한다.
		//1. SQL
		//2. 서블릿
		//3. JavaScript
		
		
		
		//페이지바 제작
		loop = 1;
		n = ((nowPage -1)/ blockSize)*blockSize +1;
		
		//list.do?page=1
		//12345678910
		
		//list.do?page= 11
		//11 12 13 14 15 16 17 18 19 20
		
		String pagebar = "";
		
		pagebar += "<nav class=\"pagebar\">";
		pagebar += "<ul class=\"pagination\">";
		
		//이진 10페이지
		if(n==1) {
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			pagebar += String.format("<a href=\"/soccer/notice.do?page=%d\" aria-label=\"Previous\">", n - 1);
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			//페이지 번호
			if (n == nowPage) {
				pagebar += "<li class='active'>";
				pagebar += String.format("<a href=\"#!\">%d</a>", n);
				pagebar += "</li>";
			} else {			
				pagebar += "<li>";
				pagebar += String.format("<a href=\"/soccer/notice.do?page=%d\">%d</a>", n, n);
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
			pagebar += String.format("<a href=\"/Project/notice.do?page=%d\" aria-label=\"Next\">", n);
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
				
		pagebar += "</ul>";
		pagebar += "</nav>";
		
		
		
		//2. 결과값 전달 + JSP 호출
		req.setAttribute("list", list);
		req.setAttribute("search", search);
//		req.setAttribute("sort", sort);
		
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("pagebar", pagebar);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice.jsp");
		dispatcher.forward(req, resp);
		
		
		

	}
	

}
