package com.test.soccer.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;

public class MemberDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemberDAO() {
		//DB 연결
		
		DBUtil util = new DBUtil();
		conn = util.open();
		
	}
	
	
	//회원가입 insert
	public int add(MemberDTO dto) {
		
		try {

			String sql = "insert into tblMember (seq, name, id, pw, tel, birth, address, regdate, image, home_seq) values (Member_seq.nextVal, ?, ?, ?, ?, to_date(?,'yyyy-mm-dd'), ?, default, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getPw());
			pstat.setString(4, dto.getTel());
			pstat.setString(5, dto.getBirth().replace("-", ""));
			pstat.setString(6, dto.getAddress());
			pstat.setString(7, dto.getImage());
			pstat.setString(8,dto.getHomeseq().substring(0,1));
			
			System.out.println("insert완료");
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemberDAO.add()");
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	//Login 서블릿이 아이디와 암호를 줄테니 이사람이 회원이 맞는지 검사?
		public int login(MemberDTO dto) {
			
			try {

				String sql = "select count(*) as cnt from tblMember where id=? and pw=?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getId());
				pstat.setString(2, dto.getPw());
				
				rs = pstat.executeQuery();
				
				if (rs.next()) {
					return rs.getInt("cnt");
				}

			} catch (Exception e) {
				System.out.println("MemberDAO.login()");
				e.printStackTrace();
			}
			
			return 0;
		}

		//Login 서블릿이 아이디를 줄테니 회원 정보 전부를 다오.
		public MemberDTO getMember(String id) {
			
			try {

				String sql = "select * from tblMember where id = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, id);
				
				rs = pstat.executeQuery();
				
				if (rs.next()) {
					//DTO -> Data Transfer Object
					//VO -> Value Object
					MemberDTO dto = new MemberDTO();
					
					dto.setSeq(rs.getString("seq"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setImage(rs.getString("image"));
					
					return dto;	
				}

			} catch (Exception e) {
				System.out.println("MemberDAO.getMember()");
				e.printStackTrace();
			}
			
			return null;
		}

		
		
		//회원 명단 리스트
		public ArrayList<MemberDTO> getMemberInfo(HashMap<String, String> map) {
			
			
			try {
				String sql = "";
				
				//검색어 있을때
				if(map.get("search") != null) {
					
				
					sql = String.format("select * from (select a.*, rownum as rnum from vwplayerInfo a) where membername like '%s'", map.get("search"));
					
				}else {
					
				sql = String.format("select * from (select a.*, rownum as rnum from vwplayerInfo a) where rnum >= %s and rnum <= %s",map.get("begin"), map.get("end"));
				
				}
//				System.out.println(map.get("begin"));
//				System.out.println(map.get("end"));
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				
				ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
				
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					
					dto.setMseq(rs.getString("memberseq"));
					dto.setImage(rs.getString("image"));
					dto.setName(rs.getString("membername"));
					dto.setTeam(rs.getString("teamname"));
					dto.setBirth(rs.getString("birth").substring(0, 10));
					dto.setPosition(rs.getString("position"));
					
					
					list.add(dto);
					
				}
				
				
				
				return list;
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			return null;
		}


		public int getTotalCount(HashMap<String, String> map) {
			try {
//				System.out.println(map.toString());
				String where = "";
				
				if (map.get("search") != null) {
					//이름 & 제목 & 내용 - 포괄 검색
					where = String.format("where membername like '%s'", map.get("search"));
				}

				String sql = String.format("select count(*) as cnt from vwplayerInfo %s", where);
				
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				if (rs.next()) {
					return rs.getInt("cnt");
				}
				

			} catch (Exception e) {
//				System.out.println("MemberDAO.getTotalCount()");
				e.printStackTrace();
			}
			
			return 0;
		}


		public MemberDTO get(String mseq) {
			
			try {
				
				String sql = "select * from vwDetailPlayerInfo where memberseq = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, mseq); //회원번호
				
				rs = pstat.executeQuery();
				
				if (rs.next()) {
					
					MemberDTO dto = new MemberDTO();
					
					dto.setMseq(rs.getString("memberseq"));
					dto.setName(rs.getString("membername"));
					dto.setBirth(rs.getString("birth").substring(0, 10));
					dto.setTeam(rs.getString("teamname"));
					dto.setPosition(rs.getString("position"));
					dto.setBacknumber(rs.getString("backnumber"));
					dto.setHeight(rs.getString("height"));
					dto.setWeight(rs.getString("weight"));
					dto.setImage(rs.getString("image"));
					
					return dto;				
				}

			} catch (Exception e) {
				System.out.println("MemberDAO.get()");
				e.printStackTrace();
			}
			
			return null;
		}


		public ArrayList<MemberDTO> getData() {
			
			
			try {
				
				String sql = "select * from tblhome";
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
				
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setHome(rs.getString("home"));
					
					
					list.add(dto);
					
				}
				
				return list;
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
			return null;
		}


		public MemberDTO team1Stat(String team1) {
			
			
			try {
				
				
				
				
				String sql = "select membername, sum(goal+assist) total, sum(goal) goal , sum(assist) assist , sum(foul) foul from vwteamanlysis where teamname= ? group by membername order by total desc";
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, team1); //회원번호
				
				rs = pstat.executeQuery();
				
				
				ArrayList<MemberDTO> team1list = new ArrayList<MemberDTO>();
				
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					
					dto.setName(rs.getString("membername"));
					dto.setLgoal(rs.getString("goal"));
					dto.setAssist(rs.getString("assist"));
					dto.setTotal(rs.getString("total"));
					
//					System.out.println(dto.getLgoal());
//					System.out.println(dto.getAssist());
//					System.out.println(dto.getFoul());
					
					return dto;
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return null;
		}


		public MemberDTO team2Stat(String team2) {
			
			try {
				
				
				
				String sql = "select membername, sum(goal+assist) total, sum(goal) goal , sum(assist) assist , sum(foul) foul from vwteamanlysis where teamname= ? group by membername order by total desc";
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, team2); //회원번호
				
				rs = pstat.executeQuery();
				
				
				ArrayList<MemberDTO> team1list = new ArrayList<MemberDTO>();
				
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					
					dto.setName(rs.getString("membername"));
					dto.setLgoal(rs.getString("goal"));
					dto.setAssist(rs.getString("assist"));
					dto.setTotal(rs.getString("total"));
					
//					System.out.println(dto.getLgoal());
//					System.out.println(dto.getAssist());
//					System.out.println(dto.getFoul());
					
					return dto;
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}


		public MemberDTO team1StatAvg(String team1) {
			
			try {
				
				String sql = "select round(sum(goal)/18,1) as goalavg, rtrim(to_char((round(sum(assist)/18,1)),'FM99990D99'),'.') as assistavg, round(sum(goal+assist)/18,1) as totalavg from vwteamanlysis where teamname = ?";
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, team1); //회원번호
				
				rs = pstat.executeQuery();
				
				
				ArrayList<MemberDTO> team1list = new ArrayList<MemberDTO>();
				
				while(rs.next()) {
					MemberDTO dto2 = new MemberDTO();
					
					dto2.setGoalavg(rs.getString("goalavg"));
					dto2.setAssistavg(rs.getString("assistavg"));
					dto2.setTotalavg(rs.getString("totalavg"));
					
					
					return dto2;
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}


		public MemberDTO team2StatAvg(String team2) {
			try {
				
				String sql = "select round(sum(goal)/18,1) as goalavg, rtrim(to_char((round(sum(assist)/18,1)),'FM99990D99'),'.') as assistavg, round(sum(goal+assist)/18,1) as totalavg from vwteamanlysis where teamname = ?";
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, team2); //회원번호
				
				rs = pstat.executeQuery();
				
				
				ArrayList<MemberDTO> team1list = new ArrayList<MemberDTO>();
				
				while(rs.next()) {
					MemberDTO dto2 = new MemberDTO();
					
					dto2.setGoalavg(rs.getString("goalavg"));
					dto2.setAssistavg(rs.getString("assistavg"));
					dto2.setTotalavg(rs.getString("totalavg"));
					
					
					return dto2;
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}

		
		
		//선수 선택시 선수 정보 가져오기
		public MemberDTO playerAnalysisInfo(String player1) {
			try {
				
				String sql = "select distinct membername, birth, image, height, weight, position  from vwteamanlysis where membername=?";
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, player1); //회원번호
				
				rs = pstat.executeQuery();
				
//				System.out.println("info");
				
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					
					dto.setName(rs.getString("membername"));
					dto.setImage(rs.getString("image"));
					dto.setBirth(rs.getString("birth").substring(0, 10));
					dto.setHeight(rs.getString("height"));
					dto.setWeight(rs.getString("weight"));
					dto.setPosition(rs.getString("position"));
					
					
					return dto;
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}


		public MemberDTO playerAnalysisStat(String player1) {
			try {
				
				String sql = "select count(membername) as count,sum(goal+assist)as total, sum(goal)as goal , sum(assist)as assist, sum(foul) as foul, sum(tackle) as tackle, sum(save) as saves  from vwteamanlysis where membername=?";
				
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, player1); //회원번호
				
				rs = pstat.executeQuery();
				
				
				
				while(rs.next()) {
					MemberDTO dto2 = new MemberDTO();
					
					dto2.setCount(rs.getString("count"));
					dto2.setLgoal(rs.getString("goal"));
					dto2.setAssist(rs.getString("assist"));
					dto2.setFoul(rs.getString("foul"));
					dto2.setTackle(rs.getString("tackle"));
					dto2.setSaves(rs.getString("saves"));
					
					
					return dto2;
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}


		public ArrayList<MemberDTO> getLeagueStat(String mseq) {
			
			try {
				String sql = "select count(membername) as count,sum(goal+assist)as total, sum(goal)as goal , sum(assist)as assist, sum(foul)as foul, sum(tackle) as tackle, sum(save) as save, sum(yellowcard) as yellow from vwteamanlysis where seq=?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, mseq); //회원번호
				
				rs = pstat.executeQuery();
				
				
				ArrayList<MemberDTO> leagueStat = new ArrayList<MemberDTO>();
				
				
				while(rs.next()) {
					
					MemberDTO dto = new MemberDTO();
					
					dto.setCount(rs.getString("count"));
					dto.setLgoal(rs.getString("goal"));
					dto.setAssist(rs.getString("assist"));
					dto.setFoul(rs.getString("Foul"));
					dto.setTackle(rs.getString("tackle"));
					dto.setSaves(rs.getString("save"));
					dto.setYellowCard(rs.getString("yellow"));
					
					leagueStat.add(dto);
				}
				
				
				
				return leagueStat;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}


		public ArrayList<MemberDTO> getFriendlyStat(String mseq) {
			
			try {
				String sql = "select memberseq, sum(goal) as goal, count(memberseq) as count from vwDetailInfo where memberseq = ? group by memberseq ";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, mseq); //회원번호
				
				rs = pstat.executeQuery();
				
				
				ArrayList<MemberDTO> friendlyStat = new ArrayList<MemberDTO>();
				
				
				while(rs.next()) {
					
					MemberDTO dto = new MemberDTO();
					
					dto.setCount(rs.getString("count"));
					dto.setLgoal(rs.getString("goal"));
					
					friendlyStat.add(dto);
				}
				
				
				
				return friendlyStat;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}



		
	
	
}
