package com.test.soccer.team;

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

@WebServlet("/team/teamrecord.do")
public class TeamRecord extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. DB작업 > select
		// 2. 결과값 전달 + jsp호출하기

		// 세션얻어오기
		HttpSession session = req.getSession();

		// 일반 목록인지 검색인지 구분하기
		// 목록 : list.do
		// 검색 : list.do?search=검색어
		// 검색어
		String search = req.getParameter("search");

		// 정렬 기준
		// list.do
		// list.do?sort=seq
		// list.do?sort=readcount
		// list.do?sort=heart

		// 페이지당 출력수
		String selectrow = req.getParameter("selectrow");

		// 검색 방법
		String selectKeyword = req.getParameter("selectKeyword");

		// 한페이지 당 출력 갯수 초기값이 null이라 10으로 default
		if (selectrow == null) {
			selectrow = 10 + "";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);// 검색어
		map.put("selectKeyword", selectKeyword);

		// 페이징 처리 관련 변수
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 10; // 한페이지 당 출력 갯수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // rnum 시작 번호
		int end = 0; // rnum 끝 번호
		int n = 0; // 페이지바 관련 변수
		int loop = 0; // 페이지바 관련 변수
		int blockSize = 10; // 페이지바 관련 변수

		// list.do-> list.do?page=1로 변경

		String page = req.getParameter("page");
		if (page == null || page == "")
			nowPage = 1;// default값
		else
			nowPage = Integer.parseInt(page);

		// nowPage -> 보려는 페이지 번호
		// 1page ->where rnum >=1 and rnum <=10
		// 2page ->where rnum >=11 and rnum <=20
		// 3page ->where rnum >=21 and rnum <=30

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("begin", begin + "");
		map.put("end", end + "");

		// 1.
		TeamRecordDAO dao = new TeamRecordDAO();
		
		// 총 페이지 수 계산하기
				// 총 페이지 수 = 총 게시물 수 / 한페이지 당 출력 게시물 수
				// ?= 243/10 -> 24.3 -> 25
		
		totalCount = dao.getTotalCount(map);
		System.out.println(totalCount);
		totalPage = (int) Math.ceil((double) totalCount / pageSize);
		
		
		ArrayList<TeamRecordDTO> list = dao.list(map);
		
		// 1.5
		// c.최신글 표시하기
		// 글쓴지 1시간 이내의 글 들을 최신글이라고 가정
		// - 현재시각 - 글쓴 시각 < 1시간
		// 얘는 sql에서 한다.

//		Calendar now = Calendar.getInstance();
//		for (TeamRecordDTO dto : list) {
//
//			if (dto.getRegdate().substring(0, 10).equals(String.format("%tF", now))) {
//				dto.setRegdate(dto.getRegdate().substring(11));
//
//			} else {
//				dto.setRegdate(dto.getRegdate().substring(0, 10));
//			}
//			// ##검색어 부각##
//			if (search != null && search != "") {
//
//				String tomato = "";
//
//				if (selectKeyword.equals("title")) { // 제목 검색일때
//					tomato = dto.getTitle();
//					tomato = tomato.replace(search,
//							"<span style='font-weight:bold; color:tomato;'>" + search + "</span>");
//					dto.setTitle(tomato);
//				} else if (selectKeyword.equals("name")) { // 글쓴이 검색일때
//					tomato = dto.getName();
//					tomato = tomato.replace(search,
//							"<span style='font-weight:bold; color:tomato;'>" + search + "</span>");
//					dto.setName(tomato);
//				} else if (selectKeyword.equals("title_content")) { // 제목+내용 검색일때
//					tomato = dto.getTitle();
//					tomato = tomato.replace(search,
//							"<span style='font-weight:bold; color:tomato;'>" + search + "</span>");
//					dto.setTitle(tomato);
//				}
//
//			}
//
//		}
		
		// 새로고침에 의한 조회수 증가 방지
		session.setAttribute("read", false);

		// 페이지바 만들기
		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		String pagebar = "";
		pagebar += "<nav class=\"pagebar\" style=\"float:right;\">";
		pagebar += "<ul class=\"pagination\">";


		if (n == 1) {
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
			pagebar += " <span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";

		} else {

			pagebar += "<li>";
			if (search == null) {
				pagebar += String.format(
						"<a href=\"/soccer/board/friendlymatchrecruit.do?page=%d&selectrow=%s\" aria-label=\"Previous\">",
						n - 1, selectrow);
			} else {
				pagebar += String.format(
						"<a href=\"/soccer/board/friendlymatchrecruit.do?page=%dselectKeyword=%s&search=%s&selectrow=%s\" aria-label=\"Previous\">",
						n - 1, selectKeyword, search, selectrow);
			}
			pagebar += " <span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";

		}

//			for(int i=1;i<totalPage;i++) {
		while (!(loop > blockSize || n > totalPage)) {
			// 페이지번호
			if (n == nowPage) {
				pagebar += "<li class=\"active\">";
				pagebar += String.format("<a href='#!'>%d</a>", n);
				pagebar += "</li>";

			} else {
				pagebar += "<li>";
				if (search == null) {
					pagebar += String.format(
							"<a href=\"/soccer/board/friendlymatchrecruit.do?page=%d&selectrow=%s\">%d</a>", n,
							selectrow, n);
				} else {
					pagebar += String.format(
							"<a href=\"/soccer/board/friendlymatchrecruit.do?page=%d&selectKeyword=%s&search=%s&selectrow=%s\">%d</a>",
							n, selectKeyword, search, selectrow, n);
				}
				pagebar += "</li>";

			}

			loop++;
			n++;

		}

		// }

		// 다음 10페이지

		if (n > totalPage) {
			pagebar += "<li class=\"disabled\">";
			pagebar += "<a href=\"#!\" aria-label=\"Next\">";
			pagebar += " <span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";

		} else {

			pagebar += "<li>";
			if (search == null) {
				pagebar += String.format("<a href=\"/soccer/board/friendlymatchrecruit.do?page=%d&selectrow=%s\" aria-label=\"Next\">", n, selectrow);
				} else {
				pagebar += String.format("<a href=\"/soccer/board/friendlymatchrecruit.do?page=%d&selectKeyword=%s&search=%s&selectrow=%s\" aria-label=\"Next\">", n, selectKeyword, search, selectrow);																	
				}
	
			pagebar += " <span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
		pagebar += "</ul>";
		pagebar += "</nav>";
		
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		// page 값이 null이면 1페이지
		if (page == null || page == "")page = "1";
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("selectrow", selectrow);// 한페이지 당 출력 갯수
		req.setAttribute("selectKeyword", selectKeyword);// 검색 방법
	
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/team/teamrecord.jsp");
		dispatcher.forward(req, resp);

	}

}
