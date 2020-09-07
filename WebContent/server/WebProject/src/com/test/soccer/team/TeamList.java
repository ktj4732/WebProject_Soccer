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

import com.test.soccer.board.BoardDAO;
import com.test.soccer.board.BoardDTO;

@WebServlet("/team/teamlist.do")
public class TeamList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DB갔다오자
				
		
				//1. DB 작업 > select
			
				//2. 결과값 전달 + JSP 호출하기
				HttpSession session=req.getSession();
				
				//목록 or 검색
				// - 목록 : list.do
				// - 검색 : list.do?search=홍길동
				String search=req.getParameter("search"); // 검색어
				String searchKeyword=req.getParameter("searchKeyword"); // teamname, coachname, teamground 
				//정렬기준
				String selectRow=req.getParameter("selectRow");
				int rownum=10;
				if(selectRow!=null) {
					rownum=Integer.parseInt(selectRow);
				}
				
				
				//페이징 처리 관련 변수
				int nowPage=0;		//현재 페이지 번호
				int totalCount=0;	//총 게시물 수
				int pageSize=rownum;	//한 페이지당 출력 갯수
				int totalPage=0;	//총 페이지 수
				int begin=0;		// rnum 시작 번호
				int end=0;			//rnum 끝 번호
				int n=0;			// 패이지바 관련 변수
				int loop=0;			// 패이지바 관련 변수
				int blockSize=10;	// 패이지바 관련 변수
				
				//list.do -> list.do?page=1 변경
				//list.do?page=3
				String page=req.getParameter("page");
				
				if(page==null||page=="") nowPage=1; //default
				else nowPage=Integer.parseInt(page);//
				HashMap<String, String> map=new HashMap<String, String>();
				
				//nowPage -> 보려는 페이지 번호!!
				//1page -> where rnum between 1 and 10;
				//2page -> where rnum between 11 and 20;
				//3page -> where rnum between 21 and 30;
				begin=((nowPage-1)*pageSize)+1;
				end= begin+pageSize-1;
				map.put("begin",begin+"");
				map.put("end",end+"");
				map.put("search", search);
				map.put("searchKeyword", searchKeyword);

				
				//1.
				
				
				//총 페이지수 계산하기
				//총 페이지수 = 총 게시물 수 / 한페이지당 출력 게시물 수
				// ? = 175/10 -> 17.5 -> 18
				
				TeamlistDAO dao=new TeamlistDAO();
				ArrayList<TeamlistDTO> list= dao.list(map);
				//dao.close();
				
				totalCount =dao.getTotalCount(map);
				//System.out.println(totalCount);
				
				totalPage=(int)Math.ceil((double)totalCount/pageSize);
				//list : 게시판 목록 원본
				// -> list 가공
				
				//데이터 가공 시점
				//1. SQL
				//2. 서블릿
				//3. Javascript 
				
			
					//d. 검색어 부각시키기
					// - 제목
					
					//search != null
					//1. list.do -> false
					//2. list.do?search=홍길동 -> true
					//3. list.do?search= -> true
					
					//request.getParameter("search")
					//1. list.do -> null 반환
					//2. list.do?search=홍길동 -> '홍길동' 반환
					//3. list.do?search= -> 빈문자열 반환
//				for(TeamlistDTO dto: list) {
//					if(search!=null && search !="") {
//						String subject = dto.getSubject();
//						subject = subject.replace(search, "<span style='font-weight:bold;color:tomato;'>" + search + "</span>");
//						dto.setSubject(subject);
//						
//						String name = dto.getName();
//						name = name.replace(search, "<span style='font-weight:bold;color:tomato;'>" + search + "</span>");
//						dto.setName(name);
//					}
//				}//for
				
				//새로고침 조회수 증가 방지
				session.setAttribute("read", false);

				//페이지바 제작
				
				loop=1;
				n=((nowPage-1)/blockSize)*blockSize +1;
				
				String pagebar= "";
				pagebar+="<nav class='pagebar'>";
				pagebar+="<ul class='pagination'>";
				//이전 10페이지
				if(n==1) {
					pagebar+="<li class='disabled'>";
					pagebar+=" <a href='#!' aria-label='Previous'>";
					pagebar+="<span aria-hidden='true'>&laquo;</span>";
					pagebar+="</a>";
					pagebar+="</li>";
				}else {
					pagebar+="<li>";
					pagebar+=String.format("<a href='/soccer/team/teamlist.do?page=%d?selectRow=%s' aria-label='Previous'>",n-1,selectRow);
					pagebar+="<span aria-hidden='true'>&laquo;</span>";
					pagebar+="</a>";
					pagebar+="</li>";
				}
				
				
				
				
//				for(int i=1; i<=totalPage;i++) {
				while(!(loop > blockSize || n > totalPage)){
				//페이지 번호
				if(n==nowPage) {
					pagebar+="<li class=\"active\">";
					pagebar+=String.format("<a href='#!'>%d</a>",n);
					pagebar+="</li>";
				}else {
					pagebar+="<li>";
					pagebar+=String.format("<a href='/soccer/team/teamlist.do?page=%d&search=%s&searchKeyword=%s'>%d</a>",n,search,searchKeyword,n);
					pagebar+="</li>";
				}
				loop++;
				n++;
				}
				
				//다음 10페이지
				if(n > totalPage) {
					pagebar+="<li class='disabled'>";
					pagebar+=String.format("<a href=\"#!\" aria-label=\"Next\">");
					pagebar+="<span aria-hidden=\"true\">&raquo;</span>";
					pagebar+="</a>";
					pagebar+="</li>";	
				}else {
					pagebar+="<li>";
					pagebar+=String.format("<a href=\"/soccer/team/teamlist.do?page=%d\" aria-label=\"Next\">",n);
					pagebar+="<span aria-hidden=\"true\">&raquo;</span>";
					pagebar+="</a>";
					pagebar+="</li>";	
				}
				pagebar+="</ul>";
				pagebar+=" </nav>";
				
			//2.
			req.setAttribute("list", list);
			req.setAttribute("search", search);
			req.setAttribute("searchKeyword", searchKeyword);
			req.setAttribute("page", page);
			req.setAttribute("totalCount", totalCount);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("pagebar", pagebar);
			req.setAttribute("selectRow", selectRow);
		
		RequestDispatcher dispatcher= req.getRequestDispatcher("/WEB-INF/views/team/teamlist.jsp");
		dispatcher.forward(req, resp);
		
	}// doget

}// teamlist
/*

		
*/