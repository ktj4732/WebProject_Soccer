package com.test.soccer.team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;

import oracle.net.aso.p;

public class TeamlistDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public TeamlistDAO() {
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
	//teamlist 서블릿 -> 팀목록
	public ArrayList<TeamlistDTO> list(HashMap<String,String> map) {
		// TODO Auto-generated method stub
		
		String where="";
		String search=map.get("search");
		String searchKeyword=map.get("searchKeyword");
		
		
		if(searchKeyword==null||searchKeyword.equals("")) {
			searchKeyword="teamname";
		}
		
		where=String.format("where %s like '%%%s%%' ",searchKeyword,search);

		if(search==null||search=="") {
			where="";
		}
		System.out.println(where);
		try {
			//--seq, logo, name, coachname, birth, count, ground, lat,lng, points,league_seq
			String sql=String.format("select a.* from (select rownum rnum, team_seq, logo, name, coachname, to_char(birth,'yyyymmdd') birth, count, ground, lat,lng from teamlist2 %s) a where rnum between ? and ?",where);
			pstat=conn.prepareStatement(sql);
			pstat.setString(1,map.get("begin"));
			pstat.setString(2,map.get("end"));
			rs=pstat.executeQuery();
			
			//seq, logo, name, coachname, birth, count, ground, lat,lng
			ArrayList<TeamlistDTO> list=new ArrayList<TeamlistDTO>();
			while(rs.next()) {
				TeamlistDTO dto=new TeamlistDTO();
				dto.setRnum(rs.getString("rnum"));
				dto.setTeam_seq(rs.getString("team_seq"));
				dto.setLogo(rs.getString("logo"));
				dto.setName(rs.getString("name"));
				dto.setCoachname(rs.getString("coachname"));
				dto.setBirth(rs.getString("birth"));
				dto.setCount(rs.getString("count"));
				dto.setGround(rs.getString("ground"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				//dto.setPoints(rs.getString("points"));
				//dto.setLeague_seq(rs.getString("league_seq"));
				
				list.add(dto);
			}
			
			//stat.close(); 이거때매 오류 났었음!!!!
			return list;
						
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	//teamlist 서블릿 -> 리스트의 총 개수를 돌려준다.
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			String search = map.get("search");
			String searchKeyword = map.get("searchKeyword");
			
			//검색어가 있을때
			if (search != null&&searchKeyword!=null) {
				 where = String.format("where %s like '%%%s%%'", searchKeyword , search);
				 //teamname, coachname, ground
					
			} else if (search == ""|| search==null) { //처음 게시판에 들어왔을때 검색어가 없어 null오류가 떠서 했음
				where = "";
			}
			
			//String sql = String.format("select count(*) cnt from(select rownum rnum, team_seq, logo, name, coachname, to_char(birth,'yyyymmdd') birth, count, ground, lat,lng from teamlist2) where rnum between ? and ?");
			String sql = String.format("select count(*) cnt from teamlist2 %s",where);
			System.out.println(sql);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {

			System.out.println("BoardDAO.getTotalCount()");
			e.printStackTrace();
			
		}
		
		return 0;
	}
	//teaminformation.do 에서 개별 팀정보를 전해준다.
	public TeamInformationDTO getTeamInformation(String teamname) {
		// TODO Auto-generated method stub
		try {
			/*
			 team.seq seq,member.name coachname, member.image image, coach.introduce,team.logo logo,
			 team.name teamname, team.birth birth, team.slogan slogan, team.hello hello,
			 teamground.name ground, teamground.address address, teamground.lat lat, teamground.lng lng,
			 home.home home
			 */
			String where="";
			if(teamname!=null) {
				where=String.format("where teamname='%s'",teamname);
			}
			String sql=String.format("select*from team %s",where);
		
			pstat=conn.prepareStatement(sql);

			rs=pstat.executeQuery();
			
			while(rs.next()) {
				TeamInformationDTO dto=new TeamInformationDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCoachname(rs.getString("coachname"));
				dto.setImage(rs.getString("image"));
				dto.setIntroduce(rs.getString("introduce"));
				dto.setLogo(rs.getString("logo"));
				dto.setTeamname(rs.getString("teamname"));
				dto.setBirth(rs.getString("birth"));
				dto.setSlogan(rs.getString("slogan"));
				dto.setHello(rs.getString("hello"));
				dto.setGround(rs.getString("ground"));
				dto.setAddress(rs.getString("address"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setHome(rs.getString("home"));

				return dto;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	//teaminformation 에서 선수 정보를 준다
	public ArrayList<PlayerInformationDTO> getPlayerInformation(String teamname) {
		// TODO Auto-generated method stub
		/*
		 select*from player
		 mt.seq member_Seq, mt.backnumber backnumber, mt.height height,
	     mt.weight weight, position.position position, member.name playername,
	     member.image playerimage, to_char(member.birth,'yyyymmdd') birth,
	     team.name teamname, to_char(transfer.completedate,'yyyymmdd') completedate
		 */
		try {
			String where ="";
			if(teamname!=null||teamname!="") {
				where=String.format("where teamname='%s'",teamname);
			}
			String sql=String.format("select*from player %s",where);
			
			//return 할 ArrayList<>
			ArrayList<PlayerInformationDTO> playerInfo=new ArrayList<PlayerInformationDTO>();
			
			pstat=conn.prepareStatement(sql);
			rs=pstat.executeQuery();
			while(rs.next()) {
				PlayerInformationDTO dto=new PlayerInformationDTO();
				dto.setMember_seq(rs.getString("member_seq"));
				dto.setBacknumber(rs.getString("backnumber"));
				dto.setHeight(rs.getString("height"));
				dto.setWeight(rs.getString("weight"));
				dto.setPlayerimage(rs.getString("playerimage"));
				dto.setPlayername(rs.getString("playername"));
				dto.setBirth(rs.getString("birth"));
				dto.setCompletedate(rs.getString("completedate"));
				dto.setPosition(rs.getString("position"));
				dto.setTeamname(rs.getString("teamname"));
				dto.setMseq(rs.getString("mseq"));
				
				playerInfo.add(dto);
			}
			
			return playerInfo;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<LeagueDTO> getLeague() {
		// TODO Auto-generated method stub
		
		try {
			ArrayList<LeagueDTO> list=new ArrayList<LeagueDTO>();
			String sql="select seq, name, to_char(startdate,'yyyymmdd') startdate, to_char(enddate,'yyyymmdd') enddate from tblleague";
			stat=conn.createStatement();
			
			rs=stat.executeQuery(sql);
			
			while(rs.next()) {
				LeagueDTO dto=new LeagueDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setStartDate(rs.getString("startdate"));
				dto.setEndDate(rs.getString("enddate"));
				
				list.add(dto);
			}//while
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	//teaminformation 서블릿에 rnum 건내주기
	public int rnum(String teamname) {
		// TODO Auto-generated method stub
		try {
			String sql="select * from ranking where teamname = ? and league_seq > 0";
			pstat=conn.prepareStatement(sql);
			pstat.setString(1,teamname);
			rs=pstat.executeQuery();
			if(rs.next()) {
				return rs.getInt("rnum");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0;
	}
	//teaminformation -> 포기
	public ArrayList<TeamInformationDTO> getRival(int rnum) {
		// TODO Auto-generated method stub
		
		int league_seq=((rnum-1)/16) +1;
		int rank=rnum%16;
		
		int up=0;
		int down=0;
		
		if(rank==1) {
			up=rank;
			down=rank+2;
		}else if(rank==0) {
			up=rank-2;
			down=16;
		}else {
			up=rank-1;
			down=rank+1;
		}
		
		ArrayList<TeamInformationDTO> list= new ArrayList<TeamInformationDTO>();
		String[] teamseq=new String[3];
		try {
			String sql="select seq from ranking where rnum between ? and ?";
			pstat=conn.prepareStatement(sql);
			pstat.setInt(1, up);
			pstat.setInt(2, down);
			
			rs=pstat.executeQuery();
			
			while(rs.next()) {
				int i=0;
				teamseq[i++]=rs.getString("seq");
			}
			pstat.close();
			
			String sql2="select * from ranking where seq in(?,?,?)";
			pstat=conn.prepareStatement(sql2);
			pstat.setString(1, teamseq[0]);
			pstat.setString(2, teamseq[1]);
			pstat.setString(3, teamseq[2]);
			
			rs=pstat.executeQuery();
			while(rs.next()) {
				TeamInformationDTO dto=new TeamInformationDTO();
				
				dto.setRnum(rs.getString("rnum"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	//teaminformation -> ranking 을 이용해서 그래프그리기
	public String getRank(String teamname, int latestLeague) {
		// TODO Auto-generated method stub
		try {
			String sql="select * from ranking where teamname=?";
			pstat=conn.prepareStatement(sql);
			pstat.setString(1,teamname);
			rs=pstat.executeQuery();
			HashMap<String,String> map=new HashMap<String, String>();
			
			while(rs.next()) {
				map.put(rs.getString("league_seq"),rs.getString("rnum"));
				
			}
			String temp="[";
			for(int i=1;i<=latestLeague;i++) {
				String rnum=map.get(i+"");
				if(rnum!=null) {
					temp+=Integer.parseInt(rnum)%16==0?16+",":Integer.parseInt(rnum)%16+",";
				}else if(rnum==null) {
					temp+="null,";
				}
			}
			temp=temp.substring(0,temp.length()-1);
			temp+="]";
			return temp;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	//teaminformation -> 가장 최근 리그 가져온다.
	public int getLatest() {
		// TODO Auto-generated method stub
		try {
			String sql="select max(league_seq) max from ranking";
			
			stat=conn.createStatement();
			rs=stat.executeQuery(sql);
			if(rs.next()) {
				return rs.getInt("max");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0;
	}
}//TeamlistDAO
