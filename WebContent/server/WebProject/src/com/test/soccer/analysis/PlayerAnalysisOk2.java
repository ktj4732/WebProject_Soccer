package com.test.soccer.analysis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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


@WebServlet("/analysis/playerAnalysisok2.do")
public class PlayerAnalysisOk2 extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		AjaxDAO dao1 = new AjaxDAO();
		
		
		
		
		String team1 = req.getParameter("team1");
//		System.out.println(home1);
		
		ArrayList<MemberDTO> listPlayer = dao1.getPlayer(team1);
//		req.setAttribute("listteam", listteam);
		
		JSONArray arr = new JSONArray();
		
		for (MemberDTO dto : listPlayer) {
			JSONObject obj = new JSONObject();
			obj.put("player", dto.getName());
			arr.add(obj);
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter(); 
		writer.print(arr);
		writer.close();
		
		
		
		
		
	}
}
