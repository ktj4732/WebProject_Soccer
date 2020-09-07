package com.test.soccer.schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;

public class LeagueResultDAO {

	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	private ResultSet rs2;

	public LeagueResultDAO() {
		// DB 연결

		DBUtil util = new DBUtil();
		conn = util.open();

	}

	public void close() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<LeagueResultDTO> result() {
		
		try {
			String sql="";
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
