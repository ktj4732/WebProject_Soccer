package com.test.soccer.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.soccer.member.MemberDTO;

@WebServlet("/board/writingDrawupok.do")
public class writingDrawupOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
				
		//1.데이터 가져오기
		//2.DB 작업 > insert
		//3.결과 처리
				
		//1.
		HttpSession session = req.getSession();
		
		//파일업로드 처리
		
		//가상 경로를 물리적으로 바꿔즌 메소드
		String path = req.getRealPath("/files");
		
		System.out.println(path);
		
		//업로드할 파일의 최대 크기
		int size = 1024 * 1024 * 100;
		
		//변수 선언
		String member_seq = (String)session.getAttribute("seq");	//회원 번호
				
		String title = "";			//제목
		String content = "";		//내용
		String category_seq = "";	//카테고리 번호
			
		String filename = "";		//첨부파일명
		String orgfilename = ""; 	//첨부파일명
		
		try {
			
			//기존의 request를 대신할 객체
			MultipartRequest multi = new MultipartRequest(
										req,		//기존 request 객체
										path,		//업로드 폴더
										size,		//업로드 크기
										"UTF-8",	//인코딩
										new DefaultFileRenamePolicy() //똑같은 이름에 파일을 업로드하면 뒤에 넘버링을 붙여주는 애					
										);
			
			title = multi.getParameter("title");				//제목
			content = multi.getParameter("content");			//내용
			category_seq = multi.getParameter("category_seq"); 	//카테고리 번호
			
			//올리때 같은 이름이 있으면 넘버링 해서 올려줌
			filename = multi.getFilesystemName("attach");
			
			//내려 받기 할때는 원래 이름으로 고쳐서 줌
			orgfilename = multi.getOriginalFileName("attach");
			
					
		} catch (Exception e) {			
			e.printStackTrace();			
		}
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCategory_seq(category_seq);
		dto.setFilename(filename);
		dto.setOrgfilename(orgfilename);
		dto.setMember_seq(member_seq);
		
		int result = dao.write(dto);
				
		if (result == 1) {
			
			String location = "";
			
			//글쓰기 성공
			if(category_seq.equals("1")) {
				location="/soccer/board/communityQuestionBulletinBoard.do";
			} else if(category_seq.equals("2")) {
				location="/soccer/board/communityGalleryBulletinBoard.do";				
			} else if(category_seq.equals("3")) {
				location="/soccer/board/communityFreeBulletinBoard.do";				
			} else if(category_seq.equals("4")) {
				location="/soccer/board/communityLectureBulletinBoard.do";				
			} else if(category_seq.equals("5")) {
				location="/soccer/board/friendlymatchrecruit.do";				
			} else if(category_seq.equals("6")) {
				location="/soccer/board/mercenaryrecruit.do";				
			}  
			
			
			resp.sendRedirect(location);
			
		} else {
			//글쓰기 실패
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();	
		}
		
		
	}
}//writringDrawupOk
