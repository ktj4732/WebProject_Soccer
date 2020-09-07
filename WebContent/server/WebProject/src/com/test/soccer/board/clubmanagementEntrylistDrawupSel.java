package com.test.soccer.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.soccer.member.AjaxDAO;

@WebServlet("/board/clubmanagementEntrylistDrawupSel.do")
public class clubmanagementEntrylistDrawupSel extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1. DB 작업 
		//2. 위치 정보 반환
		
		//세션의 회원번호
		HttpSession session = req.getSession();
		String member_seq = session.getAttribute("seq").toString();
		
		//선택한 포메이션
		String formation = req.getParameter("formation");
		
//		String formationNum = req.getParameter("formationNum");
		
		
//		if (req.getParameter("formationNum") == null) {
//			formationNum = "422";
//		}
		
//		System.out.println("formationNum : " + formationNum);
				
		if (req.getParameter("formation") == null) {
			formation = "422";
		}
		
		//1.
		AjaxDAO dao = new AjaxDAO();
		
		//팀번호 가져오기
		String team_seq = dao.getTeam_seq(member_seq);
		
		//포메이션 위치 값 가져오기
		ArrayList<formationDTO> list = dao.formation(team_seq);
		
		
		//포지션별 seq 가져오기		
		formationDTO dto2 = new formationDTO();		
		dto2.setTeam_seq(team_seq);
		dto2.setFormation(formation);
//		dto2.setFormation(formationNum);
		
		String position_seq = "";
		
		//공격수 seq 가져오기
		position_seq = "1";
		dto2.setPosition_seq(position_seq);
		ArrayList<formationDTO> fwList = dao.Position_Seq(dto2);
		
		//미드필더 seq 가져오기
		position_seq = "2";
		dto2.setPosition_seq(position_seq);
		ArrayList<formationDTO> mfList = dao.Position_Seq(dto2);
		
		//수비수 seq 가져오기
		position_seq = "3";
		dto2.setPosition_seq(position_seq);
		ArrayList<formationDTO> dfList = dao.Position_Seq(dto2);
		
		//골키퍼 seq 가져오기
		position_seq = "4";
		dto2.setPosition_seq(position_seq);
		ArrayList<formationDTO> gkList = dao.Position_Seq(dto2);
		
		resp.setCharacterEncoding("UTF-8");
		
		//2.
//		req.setAttribute("list", list);
//		req.setAttribute("fwList", fwList);
//		req.setAttribute("mfList", mfList);
//		req.setAttribute("dfList", dfList);
//		req.setAttribute("gkList", gkList);
		
		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
		
		obj.put("list", list);
		obj.put("fwList", fwList);
		obj.put("mfList", mfList);
		obj.put("dfList", dfList);
		obj.put("gkList", gkList);

		PrintWriter writer=resp.getWriter();
		writer.print(obj);
		
		
		
	}

}