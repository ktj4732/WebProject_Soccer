package com.test.soccer.analysis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.soccer.member.AjaxDAO;
import com.test.soccer.member.MemberDAO;
import com.test.soccer.member.MemberDTO;

@WebServlet("/analysis/playerAnalysisok3.do")
public class PlayerAnalysisOk3 extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		
		//select 팀 주요선수 스텟
		String player1 = req.getParameter("player1");
		
//		System.out.println(player1);
		//팀 주목할선수 데이터
		MemberDTO dto = dao.playerAnalysisInfo(player1);
		
		//팀평균 데이터
		MemberDTO dto2 = dao.playerAnalysisStat(player1);
		
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
//		String c8=String.format("[%s,%s,%s,%s,%s]",dto2.getLgoal(), dto2.getAssist(), dto2.getFoul(), dto2.getTackle(), dto2.getSaves());
//		
//		System.out.println(c8);
		
		writer.printf("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s"
					,dto.getName()
					,dto.getBirth()
					,dto.getHeight()
					,dto.getWeight()
					,dto.getPosition()
					,dto2.getCount()
					,dto2.getLgoal()
					,dto2.getAssist()
					,dto2.getFoul()
					,dto2.getTackle()
					,dto2.getSaves()
					,dto.getImage());
					
		
		writer.close();
		
		
	}
}
