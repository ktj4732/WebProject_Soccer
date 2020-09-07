package com.test.soccer.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/mypage/mypageinfoupdateok.do")
public class MypageInfoUpdateOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션가져오기
		HttpSession session = req.getSession();

		// 1.데이터 가져오기(수정할 값들)
		req.setCharacterEncoding("UTF-8");
		String seq = (String) session.getAttribute("seq");
//		String name = req.getParameter("name");
//		String height = req.getParameter("height");
//		String weight = req.getParameter("weight");
	
			
		//사진 첨부파일
		String path = req.getRealPath("/files");
		
		int size = 1024 * 1024 * 100;
		String name = "";    //회원이름
		String height = "";//키
		String weight = "";//몸무게
		String filename ="";//첨부파일명
		String orgfilename ="";//첨부파일명
		req.setCharacterEncoding("UTF-8");
		try {

			
			MultipartRequest multi = new MultipartRequest(
										req,
										path,
										size,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
			
			name = multi.getParameter("name");
			height = multi.getParameter("height");
			weight = multi.getParameter("weight");
			
			//첨부파일명
			filename = multi.getFilesystemName("image");
//			System.out.println(filename);
			
			//클라이언트가 올렸던 원본의 이름
			orgfilename = multi.getOriginalFileName("image");
			
//			System.out.println(height);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			

		// DB작업 -> update해주기
		MypageDAO dao = new MypageDAO();
		MypageDTO dto2 = new MypageDTO();
		dto2.setSeq(seq);
		dto2.setName(name);
		dto2.setHeight(height);
		dto2.setWeight(weight);
		dto2.setImage(filename);
		
		int result = 0;
		result =dao.infoUpdate(dto2);
		
		// 3.결과처리
		if (result == 2) {
			// 수정 성공
			resp.sendRedirect("/soccer/mypage/mypage.do");

		} else if (result == 0 || result == 1) {
			// 수정 실패
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
		}
		
		
		

	}

}
