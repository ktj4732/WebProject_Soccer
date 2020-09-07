package com.test.project.result_match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.notice.DBUtil;

public class MatchDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MatchDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();	
		}
	}
	
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String sql = String.format("select count(*) as cnt from tblmatchresult");
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("MatchDAO.getTotalCount()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<MatchDTO> list(HashMap<String, String> map) {
		try {
			
			String sql = String.format("select * from(select total.* , rownum as rnum from (select r.seq as seq, r.match_seq as match_seq,m.matchdate as matchdate,t.name as hometeam, r.homegoal as homegoal,t2.name as awayteam, r.awaygoal as awaygoal ,g.name as ground from tblmatchresult r inner join tblmatch m on r.match_seq = m.seq inner join tblteam t on t.seq = m.hometeam_seq inner join tblteam t2 on t2.seq = m.awayteam_seq inner join tblteamground g on t.teamground_seq = g.seq order by %s asc) total )where rnum >= %s and rnum <=%s", 
					"matchdate",map.get("begin"),map.get("end"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<MatchDTO> list = new ArrayList<MatchDTO>();
			
			//rs -> list 복사
			while(rs.next()) {
				//레코드 1줄 -> MatchDTO 1개
				MatchDTO dto = new MatchDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setHomeTeam(rs.getString("homeTeam"));
				dto.setAwayTeam(rs.getString("awayTeam"));
				dto.setHomeGoal(rs.getString("homeGoal"));
				dto.setAwayGoal(rs.getString("awayGoal"));
				dto.setGround(rs.getString("ground"));
				dto.setMatchdate(rs.getDate("matchdate"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("MatchDTO.list()");
		}
		return null;
	}

}
