package com.test.soccer.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/member/signUpok.do")
public class SignUpOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		//1. 데이터 가져오기
		//2. 파일 업로드 처리
		//2. DB 작업 > insert
		//3. 결과 반환 > JSP 호출하기(X)
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		//1. + 2.
		String id = "";
		String pw = "";
		String name = "";
		String tel = "";
		String birth = "";
		String address = "";
		String image = "";
		String homeseq = "";
		
		int result = 0;
		
		try {

			MultipartRequest multi = new MultipartRequest(
										req,
										req.getRealPath("/images"),
										1024 * 1024 * 10,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
			
			System.out.println(req.getRealPath("/images"));
			
			//첨부 파일 유무 확인
			System.out.println(multi.getFilesystemName("image"));
			
			id = multi.getParameter("id");
			pw = multi.getParameter("password");
			name = multi.getParameter("name");
			tel = multi.getParameter("tel");
			birth = multi.getParameter("date");
			address = multi.getParameter("address");
			homeseq = multi.getParameter("homeseq");
			image = multi.getFilesystemName("image") != null ? multi.getFilesystemName("image") : "noimage.png";
			
			//DB 작업 -> 위임
			// - DB 작업 객체 -> XXXDAO
			// - Data Access Object
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = new MemberDTO();
			
			dto.setId(id);
			dto.setName(name);
			dto.setPw(pw);
			dto.setTel(tel);
			dto.setBirth(birth);
			dto.setAddress(address);
			dto.setHomeseq(homeseq);
			dto.setImage(image);
			
			//dao.add(id, name, email, pw, pic);
			result = dao.add(dto);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//JSP 작업 위임(X) -> Servlet 직접(O)
		if (result == 1) {
			
			//회원 가입 성공
			resp.sendRedirect("/soccer/main/main.do");
			
		} else {
			
			//회원 가입 실패
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
	
}







