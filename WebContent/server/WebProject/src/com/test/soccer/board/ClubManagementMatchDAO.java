package com.test.soccer.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;
import com.test.soccer.team.TeamRecordDTO;

public class ClubManagementMatchDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ClubManagementMatchDAO() {
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

	// 총 페이지 수
	public int getTotalCount(HashMap<String, String> map, String seq) {

		try {

			String sql = String.format("select count(*) as cnt from vwmatchapply where writer=%s",seq);

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
	//친선경기신청내역 가져오기
	public ArrayList<ClubManagementMatchDTO> list(HashMap<String, String> map, String seq) {
		try {
			String where = "";
			String whereTemp = "";
			String begin = map.get("begin");
			String end = map.get("end");
			
			String sql = String.format(
					"select * from (select a.*, rownum as rnum from (select * from vwmatchapply where writer=%s order by seq desc) a) where rnum >= %s and rnum <= %s",
					seq,begin, end);

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<ClubManagementMatchDTO> list = new ArrayList<ClubManagementMatchDTO>();

			while (rs.next()) {
				// 레코드 1줄 -> boardDTO 1개
				ClubManagementMatchDTO dto = new ClubManagementMatchDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setTxtTitle(rs.getString("txttitle"));
				dto.setApplyteam(rs.getString("applyteam"));
				dto.setApply(rs.getString("apply"));
				dto.setApply_seq(rs.getString("apply_seq"));
				dto.setRnum(rs.getString("rnum"));
				dto.setState(rs.getString("state"));
				list.add(dto);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	
	
	//신청승인
	public int accept(String apply_seq) {
		try {
			String sql = "update tblapplymatch set state = '승인' where seq="+apply_seq;
			stat = conn.createStatement();
			
			return stat.executeUpdate(sql);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int refuse(String apply_seq) {
		try {
			String sql = "update tblapplymatch set state = '거절' where seq="+apply_seq;
			stat = conn.createStatement();
			
			return stat.executeUpdate(sql);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	
}
