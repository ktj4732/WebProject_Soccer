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

@WebServlet("/board/friendlymatchcontents.do")
public class FriendlyMatchContents extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 데이터 가져오기
		// 2. DB작업 -> select
		// 3. 결과 반환 -> jsp호출하기

		HttpSession session = req.getSession();

		// 1. friendlymatchcontents/do?seq = 1
		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		String page = req.getParameter("page");	
		String selectKeyword = req.getParameter("selectKeyword"); // 검색방법
		String selectrow = req.getParameter("selectrow"); // 검색 출력 갯수
		String category_seq = req.getParameter("category_seq"); // 카테고리 번호
		String login_seq = (String) session.getAttribute("seq");
		String name = (String) session.getAttribute("name");//이름
		
		
		if (selectKeyword == "") {
			selectKeyword = "title";
		}

		// 2. DB담당자에게 위임
		// 글 번호 전달하고 레코드 1개 (BoardDTO반환받기)
		BoardDAO2 dao = new BoardDAO2();

		// 2.3 조회수 증가
		// 나갔다가 들어온 것만 조회수로 치는 것
		if (session.getAttribute("read") == null || (boolean) session.getAttribute("read") == false) {
			dao.updateReadCount(seq);
			session.setAttribute("read", true);
		}
		BoardDTO dto2 = new BoardDTO();
		dto2.setSeq(seq);
		dto2.setMember_seq((String) session.getAttribute("seq"));// ****

		BoardDTO2 dto = dao.get(dto2);

		
		// 2.5데이터 가공
		// a. 개행 문자 처리
		String content = dto.getContent();
		content = content.replace(".", ".<br>");
		dto.setContent(content);
		// b.검색어 부각시키기
//		if (search != null && search != "") {
//			content = content.replace(search, "<span style='font-weight:bold; color:tomato;'>" + search + "</span>");
//			dto.setContent(content);
//		}

		// 검색어가 있고 또는 빈문자가 아니고 && 내용 검색 또는 (제목+내용)검색
//		if ((search != null || search != "")
//				&& (selectKeyword.equals("content") || selectKeyword.equals("title_content"))) {
//
//			content = content.replace(search, "<span style='font-weight:bold; color:tomato;'>" + search + "</span>");
//			dto.setContent(content);
//
//		}

		// 2.7 댓글 목록 가져오기
//		ArrayList<CommentDTO> clist = dao.listComment(seq);

		// 3. BoardDAO에게 반환받은 BoardDTO(게시글1개)를 출력하기 위해서 JSP페이지에게 전달하기
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);// list.jsp에 서치 넘겨주기
//		req.setAttribute("clist", clist);//
		req.setAttribute("page", page);
		req.setAttribute("selectKeyword", selectKeyword);
		req.setAttribute("selectrow", selectrow);
		req.setAttribute("category_seq", category_seq);
		req.setAttribute("login_seq", login_seq);
		req.setAttribute("name", name);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/friendlymatchcontents.jsp");
		dispatcher.forward(req, resp);

	}

}
