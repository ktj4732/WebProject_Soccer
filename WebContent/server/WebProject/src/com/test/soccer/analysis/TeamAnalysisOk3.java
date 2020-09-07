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

@WebServlet("/analysis/teamAnalysisok3.do")
public class TeamAnalysisOk3 extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		
		//select 팀 주요선수 스텟
		String team2 = req.getParameter("team2");
		
		
		//팀 주목할 선수 데이터
		MemberDTO dto = dao.team2Stat(team2);
		
		//팀 평균 데이터
		MemberDTO dto2 = dao.team2StatAvg(team2);
		
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.printf("%s,%s,%s,%s,%s,%s,%s"
					,dto.getName()
					,dto.getLgoal()
					,dto.getAssist()
					,dto.getTotal()
					,dto2.getGoalavg()
					,dto2.getAssistavg()
					,dto2.getTotalavg());
		
		
		writer.close();
		
		
	}
}
