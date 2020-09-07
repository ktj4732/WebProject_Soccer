package com.test.soccer.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/friendsok.do")
public class FriendsOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 친구를 follow하거나 unfollow할때 처리해주는 곳
//
//		HttpSession session = req.getSession();
//		String seq = (String) session.getAttribute("seq");
//		String follower_seq = req.getParameter("follower_seq");
//		String following_seq = req.getParameter("following_seq");
//		
//		System.out.println("팔로잉번호"+following_seq);
//		System.out.println("팔로워번호"+follower_seq);
//		// 작업 위임
//
//		MypageDAO dao = new MypageDAO();
//		FriendsDTO dto = new FriendsDTO();
//		
//		dto.setFollower_seq(follower_seq);
//		dto.setFollowing_seq(following_seq);
//		
//		// 친구를 추가 (follow)
//		int result = dao.follow(dto, seq);
//
//		// 친구 삭제(unfollow)
//		int result2 = dao.unfollow(dto, seq);
////		dao.close();
//
//		// 3.
//		if (result == 1) {
//			// 친구 추가 성공
//			resp.sendRedirect("/soccer/mypage/friends.do");
//			return;
//		} else {
//			//  실패
//			PrintWriter writer = resp.getWriter();
//			writer.print("<html>");
//			writer.print("<body>");
//			writer.print("<script>");
//			writer.print("alert('failed'); history.back();");
//			writer.print("</script>");
//			writer.print("</body>");
//			writer.print("</html>");
//			writer.close();
//
//		}
//		
//		
//		if (result2 == 1) {
//			// 친구 삭제 성공
//			resp.sendRedirect("/soccer/mypage/friends.do");
//			return;
//			
//		} else {
//			// 실패
//			PrintWriter writer = resp.getWriter();
//			writer.print("<html>");
//			writer.print("<body>");
//			writer.print("<script>");
//			writer.print("alert('failed'); history.back();");
//			writer.print("</script>");
//			writer.print("</body>");
//			writer.print("</html>");
//			writer.close();
//		}
//
//	}

}
