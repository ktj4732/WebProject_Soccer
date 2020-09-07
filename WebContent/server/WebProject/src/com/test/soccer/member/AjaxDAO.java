package com.test.soccer.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;
import com.test.soccer.board.formationDTO;

public class AjaxDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;	
	
	public AjaxDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}	
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//아이디 중복검사
	public int check(String idCheck) {
		
		try {
			
			String sql = "select count(*) as cnt from tblMember where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, idCheck);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt"); //1, 0
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	
	//지역선택시 팀명단 가져오기
	public ArrayList<MemberDTO> getTeam(String home1) {
		
		String where = "";
		
		try {
//			System.out.println(home1);
			
			if(!home1.equals("")) {
				
				where = String.format("where homename = '%s'", home1);
				
//				System.out.println(where);
				
			}
			
			String sql = String.format("select teamname from vwteamstat %s",where);
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
//			System.out.println(sql);
			
			ArrayList<MemberDTO> listteam = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setTeam(rs.getString("teamname"));
//				System.out.println(dto.getTeam());
				
				listteam.add(dto);
			}
			
			return listteam;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	//오희준
		//포미에션 위치값 가지고 오기
		public ArrayList<formationDTO> formation(String team_seq) {
			
			try {
				
				String sql = "select f.seq, f.formation, f.position_x, f.position_y from TBLTEAM te inner join TBLTRANSFER tr on te.seq = tr.team_seq inner join TBLMEMBER_TEAM mt on mt.seq = tr.seq inner join TBLPLAYERENTRY p on p.member_team_seq = mt.seq inner join TBLFORMATION f on f.playerentry_seq = p.seq inner join TBLPOSITION po on po.seq = f.position_seq inner join TBLMEMBER m on m.seq = tr.member_seq inner join TBLCOACH c on c.team_seq = te.seq where te.seq = ? order by f.seq"; 
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, team_seq);
				
				rs = pstat.executeQuery();
				
				ArrayList<formationDTO> list = new ArrayList<formationDTO>();
				
				while(rs.next()) {
					
					formationDTO dto = new formationDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setPosition_x(rs.getString("position_x"));
					dto.setPosition_y(rs.getString("position_y"));
					dto.setFormation(rs.getString("formation"));
					
					
					list.add(dto);
					
				}
				
				return list;
				
			} catch (Exception e) {
				
				System.out.println("AjaxDAO.formation()");
				e.printStackTrace();
				
			}
			
			return null;
		}
		
	//팀선택시 선수명단 가져오기
	public ArrayList<MemberDTO> getPlayer(String team1) {
		try {
			
			
			String sql = String.format("select membername from vwteamanlysis where teamname='%s' group by membername",team1);
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
//			System.out.println(sql);
			
			ArrayList<MemberDTO> listPlayer = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setName(rs.getString("membername"));
//				System.out.println(dto.getTeam());
				
				listPlayer.add(dto);
			}
			
			return listPlayer;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
		
		//오희준
		//포메이션 위치값 수정
		public int editFormation(formationDTO dto) {
			
			try {
				
				String sql = "update tblformation set position_x = ?, position_y = ? where seq = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getPosition_x());
				pstat.setString(2, dto.getPosition_y());
				pstat.setString(3, dto.getSeq());
				
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				
				System.out.println("AjaxDAO.editFormation()");
				e.printStackTrace();
				
			}
			
			return 0;
		}

		//오희준
		//팀 번호 가져오기
		public String getTeam_seq(String member_seq) {
			// TODO Auto-generated method stub
			try {
				
				String sql="select * from tblmember m inner join tblcoach c on m.seq = c.member_seq inner join tblteam t on t.seq = c.team_seq where m.seq=?";
				
				pstat=conn.prepareStatement(sql);
				pstat.setString(1,member_seq);
				
				rs=pstat.executeQuery();
				if(rs.next()) {
					return rs.getString("team_seq");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
		}

		//오희준
		//포메이션에서 포지션별 seq 가져오기
		public ArrayList<formationDTO> Position_Seq(formationDTO dto2) {
			
			try {
				
				String sql = "select f.seq seq, m.image image, po.position position, mt.backnumber backnumber, m.name name, floor((sysdate - m.birth)/365) old, f.playerentry_seq formation_playerentry_seq from TBLTEAM te inner join TBLTRANSFER tr on te.seq = tr.team_seq inner join TBLMEMBER_TEAM mt on mt.seq = tr.seq inner join TBLPLAYERENTRY p on p.member_team_seq = mt.seq inner join TBLMEMBER_TEAM mt on p.MEMBER_TEAM_SEQ = mt.seq inner join TBLFORMATION f on f.playerentry_seq = p.seq inner join TBLPOSITION po on po.seq = f.position_seq inner join TBLMEMBER m on m.seq = tr.member_seq inner join TBLCOACH c on c.team_seq = te.seq where f.position_seq = ? and te.seq = ? and f.formation = ? order by f.seq";
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto2.getPosition_seq());
				pstat.setString(2, dto2.getTeam_seq());
				pstat.setString(3, dto2.getFormation());
				
				rs = pstat.executeQuery();
				
				ArrayList<formationDTO> list = new ArrayList<formationDTO>();
				
				while (rs.next()) {
				
					formationDTO dto = new formationDTO();				
					dto.setSeq(rs.getString("seq"));
					dto.setImage(rs.getString("image"));
					
					dto.setPosition(rs.getString("position"));
					dto.setBacknumber(rs.getString("backnumber"));
					dto.setName(rs.getString("name"));
					dto.setOld(rs.getString("old"));
					
					dto.setFormation_playerentry_seq(rs.getString("formation_playerentry_seq"));
					
									
					list.add(dto);
					
				}
				
				return list;
				
			} catch (Exception e) {
				
				System.out.println("AjaxDAO.Position_seq");
				e.printStackTrace();
				
			}
			
			return null;
		}

		//오희준
		//엔트리 목록 가져오기
		public ArrayList<formationDTO> entryList(formationDTO dto2) {
			
			try {
				
				
				String sql = "select pe.seq entry_seq, po.position position, mt.backnumber backnumber, m.name name, floor((sysdate - m.birth)/365) old from TBLPLAYERENTRY pe inner join TBLMEMBER_TEAM mt on pe.MEMBER_TEAM_SEQ = mt.seq inner join TBLTRANSFER t on mt.TRANSFER_seq = t.seq inner join tblmember m on m.seq = t.member_seq inner join TBLPOSITION po on po.seq = mt.position_seq where t.team_Seq = ?";
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto2.getTeam_seq());
				//pstat.setString(2, dto2.getFormation());
				
				rs = pstat.executeQuery();
				
				ArrayList<formationDTO> entryList = new ArrayList<formationDTO>();
				
				while (rs.next()) {
				
					formationDTO dto = new formationDTO();
					dto.setEntry_seq(rs.getString("entry_seq"));
					dto.setPosition(rs.getString("position"));
					dto.setBacknumber(rs.getString("backnumber"));
					dto.setName(rs.getString("name"));
					dto.setOld(rs.getString("old"));
					
				
					entryList.add(dto);
					
				}
				
				return entryList;
				
			} catch (Exception e) {
				
				System.out.println("AjaxDAO.entryList()");
				e.printStackTrace();
				
			}
			
			return null;
		}
		
		//오희준
		//포메이션에서 참조키인 엔트리seq 업데이트
		public void editFormation_seq(formationDTO dto) {
		
			
			try {
				
				String sql = "update tblformation set playerentry_seq = ? where seq = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getEntry_seq());
				pstat.setString(2, dto.getSeq());			
				
				pstat.executeUpdate();
				
			} catch (Exception e) {
				
				System.out.println("AjaxDAO.editFormation_seq()");
				e.printStackTrace();
				
			}
			
		}
		
		
		//오희준
		//선발 선수 11명 리스트
		public ArrayList<formationDTO> formationList(formationDTO dto2) {
			
			try {
				
				String sql = "select f.seq seq, m.image image, po.position position, mt.backnumber backnumber, m.name name, floor((sysdate - m.birth)/365) old, f.playerentry_seq formation_playerentry_seq from TBLTEAM te inner join TBLTRANSFER tr on te.seq = tr.team_seq inner join TBLMEMBER_TEAM mt on mt.seq = tr.seq inner join TBLPLAYERENTRY p on p.member_team_seq = mt.seq inner join TBLMEMBER_TEAM mt on p.MEMBER_TEAM_SEQ = mt.seq inner join TBLFORMATION f on f.playerentry_seq = p.seq inner join TBLPOSITION po on po.seq = f.position_seq inner join TBLMEMBER m on m.seq = tr.member_seq inner join TBLCOACH c on c.team_seq = te.seq where te.seq = ? and f.formation = ? order by f.seq";
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto2.getTeam_seq());
				pstat.setString(2, dto2.getFormation());
				
				rs = pstat.executeQuery();
				
				ArrayList<formationDTO> list = new ArrayList<formationDTO>();
				
				while (rs.next()) {
				
					formationDTO dto = new formationDTO();				
					dto.setSeq(rs.getString("seq"));
					dto.setImage(rs.getString("image"));
					
					dto.setPosition(rs.getString("position"));
					dto.setBacknumber(rs.getString("backnumber"));
					dto.setName(rs.getString("name"));
					dto.setOld(rs.getString("old"));
					
					dto.setFormation_playerentry_seq(rs.getString("formation_playerentry_seq"));
					
									
					list.add(dto);
					
				}
				
				return list;
				
			} catch (Exception e) {
				
				System.out.println("AjaxDAO.Position_seq");
				e.printStackTrace();
				
			}
			
			return null;
		}
		
		//오희준
		//포메이션에서 선수 이미지 더블 클릭시 해당 위치 포지션 리스트 출력
		public ArrayList<formationDTO> recommendEntryList(formationDTO dto2) {

			try {
				
				
				String position = "";
							
				if (dto2.getPosition().equals("1")) {
					position = "FW";
				} else if (dto2.getPosition().equals("2")) {
					position = "MF";
				} else if (dto2.getPosition().equals("3")) {
					position = "DF";
				} else if (dto2.getPosition().equals("4")) {
					position = "GK";
				} 
				
				String sql = "select pe.seq entry_seq, po.position position, mt.backnumber backnumber, m.name name, floor((sysdate - m.birth)/365) old from TBLPLAYERENTRY pe inner join TBLMEMBER_TEAM mt on pe.MEMBER_TEAM_SEQ = mt.seq inner join TBLTRANSFER t on mt.TRANSFER_seq = t.seq inner join tblmember m on m.seq = t.member_seq inner join TBLPOSITION po on po.seq = mt.position_seq where t.team_Seq = ? and po.position = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto2.getTeam_seq());
				pstat.setString(2, position);
				
				rs = pstat.executeQuery();
				
				ArrayList<formationDTO> entryList = new ArrayList<formationDTO>();
				
				while (rs.next()) {
				
					formationDTO dto = new formationDTO();
					dto.setEntry_seq(rs.getString("entry_seq"));
					dto.setPosition(rs.getString("position"));
					dto.setBacknumber(rs.getString("backnumber"));
					dto.setName(rs.getString("name"));
					dto.setOld(rs.getString("old"));
					
						
					entryList.add(dto);
				}
				
				return entryList;
				
			} catch (Exception e) {
				
				System.out.println("AjaxDAO.entryList()");
				e.printStackTrace();
				
			}
			
			return null;
		}
	
	
	
	

}
