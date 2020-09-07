package com.test.soccer.broadcast;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;
import com.test.soccer.board.BoardDTO;

public class BroadCastDAO2 {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BroadCastDAO2() {
		//DB연결
		DBUtil util = new DBUtil();
		conn = util.open();
	}//BroadcastDAO
	
	public void close() {
		try {
			
		} catch (Exception e) {
	
			e.printStackTrace();
		}
	}//close
	//textbroadcast -> 단축키를 넘겨준다.
	public ArrayList<BroadCastDTO2> getBcList() {
		
		// TODO Auto-generated method stub
		
		try {
			String sql="select*from tblbroadcastact";
			stat=conn.createStatement();
			ArrayList<BroadCastDTO2> list=new ArrayList<BroadCastDTO2>();
			rs=stat.executeQuery(sql);
			while(rs.next()) {
				BroadCastDTO2 dto=new BroadCastDTO2();
				dto.setSeq(rs.getString("seq"));
				dto.setShortcut(rs.getString("shortcout"));
				dto.setEvent(rs.getString("event"));
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	//textbroadcast에서 -> 선수 정보들을 넘겨준다.
	public ArrayList<PlayerInformationDTO> getPlayerInfo(GameDTO team) {
		// TODO Auto-generated method stub
		
		try {
			ArrayList<PlayerInformationDTO> list=new ArrayList<PlayerInformationDTO>();
			String sql=String.format("select*from teamentry where teamname='%s' and league_seq=%s",team.getTeamname(),team.getLeague_seq());
			pstat=conn.prepareStatement(sql);
			
			System.out.println(sql);
			rs=pstat.executeQuery();
			while(rs.next()) {
				PlayerInformationDTO dto=new PlayerInformationDTO();
				dto.setTeamname(rs.getString("teamname"));
				dto.setPlayername(rs.getString("playername"));
				dto.setPosition(rs.getString("position"));
				dto.setBacknumber(rs.getString("backnumber"));
				dto.setTeamlogo(rs.getString("teamlogo"));
				dto.setPlayerentry_seq(rs.getString("playerentry_seq"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	//textbroadcast 에서 ->지난 중계정보를 가져온다.
	public ArrayList<textBroadCastDTO> getTextBroadCast(String leaguegame_seq) {
		// TODO Auto-generated method stub
		try {
			String sql=	"select*from textbroadcast where leaguegame_seq = ?"; 
					
			pstat=conn.prepareStatement(sql);
			pstat.setString(1, leaguegame_seq);
			ArrayList<textBroadCastDTO> list=new ArrayList<textBroadCastDTO>();
			rs=pstat.executeQuery();
			while(rs.next()) {
				textBroadCastDTO dto=new textBroadCastDTO();
				dto.setBacknumber(rs.getString("backnumber"));
				dto.setEvent(rs.getString("event"));
				dto.setLeaguegame_seq(rs.getString("leaguegame_seq"));
				dto.setTeamname(rs.getString("teamname"));
				dto.setPlayername(rs.getString("playername"));
				dto.setPosition(rs.getString("position"));
				dto.setTime(rs.getString("time"));
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	//textbroadcastok 에서 한 줄 저장하는 메소드
		public int updateTextBroadcast(BroadcastDTO1 dto) {
			// TODO Auto-generated method stub
			try {
				
				String sql="insert into tblbroadcast values((select count(*)+1 from tblbroadcast),?,?,?,?)";
				pstat=conn.prepareStatement(sql);
				pstat.setString(1, dto.getTime());
				pstat.setString(2, dto.getBroadcastAct_seq());
				pstat.setString(3, dto.getLeagueGame_seq());
				pstat.setString(4, dto.getPlayerEntry_seq());
				
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				
			}
			return 0;
		}
		
	
}