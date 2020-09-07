package com.test.soccer.player;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.soccer.member.MemberDAO;
import com.test.soccer.member.MemberDTO;
import com.test.soccer.mypage.FriendsDTO;
import com.test.soccer.mypage.MypageDAO;


@WebServlet("/player/playerDetails.do")
public class PlayerDetails extends HttpServlet{
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 -> select
		//3. 결과 반환 + JSP 호출하기
		
		HttpSession session = request.getSession();
		
		//1. view.do?seq=1
		String mseq = request.getParameter("seq");
		
		//2. DB 담당자에게 위임
		// - 글번호 전달하고 레코드 1개(BoardDTO) 반환받기
		MemberDAO dao = new MemberDAO();
		
		
		
		MemberDTO dto = dao.get(mseq);
		
		
		ArrayList<MemberDTO> friendlyStat = dao.getFriendlyStat(mseq);
		ArrayList<MemberDTO> leagueStat = dao.getLeagueStat(mseq);
		
		
				
		//3. BoardDAO에게 반환받은 BoardDTO(게시글 1개)를 출력하기 위해서 JSP 페이지에게 전달하기
		request.setAttribute("dto", dto);
		request.setAttribute("leagueStat", leagueStat);
		request.setAttribute("friendlyStat", friendlyStat);
				
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/player/playerDetails.jsp");
		dispatcher.forward(request, response);
	}
	
}

