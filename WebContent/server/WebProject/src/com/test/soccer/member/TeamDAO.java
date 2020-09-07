package com.test.soccer.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;

public class TeamDAO {
	private Connection conn;
	private Statement stat;
	private Statement stat2;
	private PreparedStatement pstat;
	private ResultSet rs;
	private ResultSet rs2;
	
	public TeamDAO() {
		//DB 연결
		
		DBUtil util = new DBUtil();
		conn = util.open();
		
	}

	public ArrayList<TeamDTO> getTeamRank() {
		
		
		try {
			String sql = "select distinct * from vwteamaRank  where rownum <=11 order by points desc";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			ArrayList<TeamDTO> list = new ArrayList<TeamDTO>();
			
			
			while(rs.next()) {
				
				TeamDTO dto = new TeamDTO();
				
				dto.setTeamName(rs.getString("name"));
				dto.setPoints(rs.getString("points"));
				
				
				list.add(dto);
			}
			
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<TeamDTO> getGoalRank() {
		try {
			String sql = "select rownum, a.* from(select seq,(select name from tblmember where seq = vw.seq)as membername ,sum(goal) as goal from vwteamanlysis vw  group by seq order by goal desc)a where rownum<=5";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			
			
			ArrayList<TeamDTO> goalRank = new ArrayList<TeamDTO>();
			
			
			while(rs.next()) {
				TeamDTO dto = new TeamDTO();
				
				
				dto.setMemberName(rs.getString("membername"));
				dto.setGoal(rs.getString("goal"));
				dto.setMseq(rs.getString("seq"));
				
				goalRank.add(dto);
			}
			
			stat.close();
			rs.close();
			
			return goalRank;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<TeamDTO> getAssistRank() {
		
		try {
			String sql = "select rownum, a.* from(select seq,(select name from tblmember where seq = vw.seq)as membername ,sum(assist) as assist from vwteamanlysis vw  group by seq order by assist desc)a where rownum<=5";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			ArrayList<TeamDTO> assistRank = new ArrayList<TeamDTO>();
			
			
			while(rs.next()) {
				
				TeamDTO dto = new TeamDTO();
				
				dto.setMemberName(rs.getString("membername"));
				dto.setAssist(rs.getString("assist"));
				dto.setMseq(rs.getString("seq"));
				
//				System.out.println(rs.getString("assist"));
				assistRank.add(dto);
			}
			
			
			stat.close();
			rs.close();
			
			return assistRank;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<TeamDTO> getTackleRank() {
		
		try {
			String sql = "select rownum, a.* from(select seq,(select name from tblmember where seq = vw.seq)as membername ,sum(tackle) as tackle from vwteamanlysis vw  group by seq order by tackle desc)a where rownum<=5";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			ArrayList<TeamDTO> tackleRank = new ArrayList<TeamDTO>();
			
			
			while(rs.next()) {
				
				TeamDTO dto = new TeamDTO();
				
				dto.setMemberName(rs.getString("membername"));
				dto.setTackle(rs.getString("tackle"));
				dto.setMseq(rs.getString("seq"));
				
//				System.out.println(rs.getString("assist"));
				tackleRank.add(dto);
			}
			
			
			stat.close();
			rs.close();
			
			return tackleRank;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<TeamDTO> getSaveRank() {
		
		try {
			String sql = "select rownum, a.* from(select seq,(select name from tblmember where seq = vw.seq)as membername ,sum(save) as save from vwteamanlysis vw  group by seq order by save desc)a where rownum<=5";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			ArrayList<TeamDTO> saveRank = new ArrayList<TeamDTO>();
			
			
			while(rs.next()) {
				
				TeamDTO dto = new TeamDTO();
				
				dto.setMemberName(rs.getString("membername"));
				dto.setSave(rs.getString("save"));
				dto.setMseq(rs.getString("seq"));
				
//				System.out.println(rs.getString("assist"));
				saveRank.add(dto);
			}
			
			
			stat.close();
			rs.close();
			
			return saveRank;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<TeamDTO> getYellowRank() {
		
		try {
			String sql = "select rownum, a.* from(select seq,(select name from tblmember where seq = vw.seq)as membername ,sum(yellowcard) as yellowcard from vwteamanlysis vw  group by seq order by yellowcard desc)a where rownum<=5";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			ArrayList<TeamDTO> yellowRank = new ArrayList<TeamDTO>();
			
			
			while(rs.next()) {
				
				TeamDTO dto = new TeamDTO();
				
				dto.setMemberName(rs.getString("membername"));
				dto.setYellowCard(rs.getString("yellowcard"));
				dto.setMseq(rs.getString("seq"));
				
//				System.out.println(rs.getString("assist"));
				yellowRank.add(dto);
			}
			
			
			stat.close();
			rs.close();
			
			return yellowRank;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<TeamDTO> getFoulRank() {
		
		try {
			String sql = "select rownum, a.* from(select seq,(select name from tblmember where seq = vw.seq)as membername ,sum(foul) as foul from vwteamanlysis vw  group by seq order by foul desc)a where rownum<=5";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			ArrayList<TeamDTO> foulRank = new ArrayList<TeamDTO>();
			
			
			while(rs.next()) {
				
				TeamDTO dto = new TeamDTO();
				
				dto.setMemberName(rs.getString("membername"));
				dto.setFoul(rs.getString("foul"));
				dto.setMseq(rs.getString("seq"));
				
//				System.out.println(rs.getString("assist"));
				foulRank.add(dto);
			}
			
			
			stat.close();
			rs.close();
			
			return foulRank;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<TeamDTO> getscheduleList() {
		
		try {
			String sql = "select * from vwbroadcastschedule where sysdate < gamedate";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			ArrayList<TeamDTO> scheduleList = new ArrayList<TeamDTO>();
			
			
			while(rs.next()) {
				
				TeamDTO dto = new TeamDTO();
				
				dto.setLeague(rs.getString("league"));
				dto.setGamedate(rs.getString("gamedate"));
				dto.setGround(rs.getString("ground"));
				dto.setHometeam(rs.getString("hometeam"));
				dto.setAwayteam(rs.getString("awayteam"));
				dto.setHomelogo(rs.getString("hometeamlogo"));
				dto.setAwaylogo(rs.getString("awayteamlogo"));
				
//				System.out.println(rs.getString("assist"));
				scheduleList.add(dto);
			}
			
			
			stat.close();
			rs.close();
			
			return scheduleList;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	
	
	
}
