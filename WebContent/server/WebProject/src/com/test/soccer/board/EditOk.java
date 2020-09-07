package com.test.soccer.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/editok.do")
public class EditOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기
		//2. DB 작업
		//3. 결과 처리
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String title = req.getParameter("title");					//제목
		String content = req.getParameter("content");				//내용
		String seq = req.getParameter("seq");						//글번호
		String search = req.getParameter("search");					//검색어
		String selectKeyword = req.getParameter("selectKeyword");	//검색 키워드
		String selectrow = req.getParameter("selectrow");			//페이지당 출력 갯수
			
		String category_seq = req.getParameter("category_seq");
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = new BoardDTO();
		dto.setSeq(seq);
		dto.setTitle(title);
		dto.setContent(content);
		
		System.out.println(dto.getCategory_seq());
		
		int result = 0;
		
		HttpSession session = req.getSession();
		
		BoardDTO dto2 = new BoardDTO();
		dto2.setSeq(seq);	//수정할 글 번호
		dto2.setId((String)session.getAttribute("id")); //로그인한 아이디
				
		if (dao.isOwner(dto2)) { //로그인한 아이디와 글쓴이가 일치한지 확인 하는 작업
			result = dao.edit(dto);	//수정하는 작업
		} else {
			result = 2;	//글쓴이 X
		}
		
		
		//3.
		if (result == 1) {
			
			//검색어가 한글인데 URL에서 한글 깨짐을 막아주기 위해서 인코딩 함
			String encodeSearch = URLEncoder.encode(search, "UTF-8");
			
			//수정 성공
			resp.sendRedirect("/soccer/board/BulletinBoardContent.do?seq=" + seq + "&selectKeyword=" + selectKeyword + "&selectrow=" + selectrow + "&search=" + encodeSearch + "&category_seq=" + category_seq);
			
		} else if (result == 0) {
			//수정 실패
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();		
		} else if (result == 2) {
			//수정 실패(글쓴이 X)
			resp.setCharacterEncoding("UTF-8");//			
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<head>");//
			writer.print("<meta charset='UTF-8'>");//
			writer.print("</head>");//
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('글쓴이만 수정 가능합니다.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();		
		}
		
		
		
	}

}
