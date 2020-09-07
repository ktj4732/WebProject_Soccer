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


@WebServlet("/analysis/playerAnalysisok.do")
public class PlayerAnalysisOk extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		AjaxDAO dao1 = new AjaxDAO();
		
		
		
		
		String home1 = req.getParameter("home1");
//		System.out.println(home1);
		
		ArrayList<MemberDTO> listteam = dao1.getTeam(home1);
//		req.setAttribute("listteam", listteam);
		
		JSONArray arr = new JSONArray();
		
		for (MemberDTO dto : listteam) {
			JSONObject obj = new JSONObject();
			obj.put("team", dto.getTeam());
			arr.add(obj);
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter(); 
		writer.print(arr);
		writer.close();
		
		
		
		
		
	}
}
