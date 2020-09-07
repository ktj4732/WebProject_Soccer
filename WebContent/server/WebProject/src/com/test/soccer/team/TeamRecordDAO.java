package com.test.soccer.team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;
import com.test.soccer.board.BoardDTO2;

public class TeamRecordDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public TeamRecordDAO() {
		// DB연결
		DBUtil util = new DBUtil();
		conn = util.open();
	}

	public void close() {
		try {

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	// 페이징에 필요한 총 게시물 수를 가져오는 메소드
	public int getTotalCount(HashMap<String, String> map) {
		try {
			String where = "";
			String whereTemp = "";
			String search = map.get("search");
			String selectKeyword = map.get("selectKeyword");
			String category = map.get("category");
			// 목록 or 검색
			if (search != null) {

				where = String.format("and %s like '%%%s%%'", selectKeyword, search);

				if (selectKeyword.equals("title_content")) { // 제목 + 내용 검색 일때

					selectKeyword = "title";// 제목 + 내용 검색 일때

					whereTemp = String.format("and %s like '%%%s%%'", selectKeyword, search);

					selectKeyword = "content";

					where = String.format("and %s like '%%%s%%' %s", selectKeyword, search, whereTemp);

				}

			}
			String sql = String.format(	
					"select count(*) as cnt from vwbroadcastschedule2 where gamedate<sysdate %s",
					 where);

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<TeamRecordDTO> list(HashMap<String, String> map) {

		try {
			String where = "";
			String whereTemp = "";
			String begin = map.get("begin");
			String end = map.get("end");
			String search = map.get("search");
			String selectKeyword = map.get("selectKeyword");
			

			//검색어가 있을때
			if (search != null) {
				
				 where = String.format("and %s like '%%%s%%'", selectKeyword , search);
				 
				 //제목 + 내용 검색 일때
				 if(selectKeyword.equals("title_content")) {
					 
					 selectKeyword = "title";
					 
					 whereTemp = String.format("and %s like '%%%s%%'", selectKeyword , search);
					 
					 selectKeyword = "content";
					 
					 where = String.format("and %s like '%%%s%%' %s", selectKeyword, search, whereTemp);
					 
				 }
				 
			}
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwbroadcastschedule2 where gamedate < sysdate order by seq desc) a) where rnum >= %s and rnum <= %s", begin, end);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<TeamRecordDTO> list = new ArrayList<TeamRecordDTO>();
			
			while(rs.next()) {
				//레코드 1줄 -> boardDTO 1개
				TeamRecordDTO dto = new TeamRecordDTO();
				dto.setLeague(rs.getString("league"));
				dto.setGameDate(rs.getString("gamedate"));
				dto.setAwayName(rs.getString("awayteam"));
				dto.setHomeName(rs.getString("hometeam"));
				dto.setGround(rs.getString("ground"));
				dto.setHomeGoal(rs.getString("homegoal"));
				dto.setAwayGoal(rs.getString("awaygoal"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setSeq(rs.getString("seq"));
				list.add(dto);
			}
			return list;
				
		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}

}
