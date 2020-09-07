package com.test.soccer.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;
import com.test.soccer.member.TeamDTO;

public class MypageDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private PreparedStatement pstat2;
	private PreparedStatement pstat3;
	private ResultSet rs;
	private ResultSet rs2;
	private ResultSet rs3;

	public MypageDAO() {
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

	// 내 정보 보기
	public ArrayList<MypageDTO> list(String seq) {

		try {
			String sql = "select * from vwmemberinfo where seq = " + seq;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			ArrayList<MypageDTO> list = new ArrayList<MypageDTO>();

			while (rs.next()) {
				MypageDTO dto = new MypageDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setTeam(rs.getString("teamname"));
				dto.setPosition(rs.getString("position"));
				dto.setHeight(rs.getString("height"));
				dto.setWeight(rs.getString("weight"));
				dto.setImage(rs.getString("image"));
				list.add(dto);
				System.out.println(dto.getPw());
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// dm조회
	public ArrayList<DmDTO> dmlist(String seq) {
		try {
			String sql = "select dm.seq, dm.read_name, dm.read_image, dm.content, to_char(dm.regdate,'yyyy-mm-dd') as regdate, dm.read_member_seq, dm.writer_member_seq, mb.name as writer_name, mb.image as writer_image from vwdm dm inner join tblmember mb on mb.seq = dm.writer_member_seq where read_member_Seq ="
					+ seq;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			ArrayList<DmDTO> dmlist = new ArrayList<DmDTO>();

			while (rs.next()) {
				DmDTO dto2 = new DmDTO();
				dto2.setSeq(rs.getString("seq"));
				dto2.setContent(rs.getString("content"));
				dto2.setRegdate(rs.getString("regdate"));
				dto2.setRead_member_seq(rs.getString("read_member_seq"));
				dto2.setWriter_member_seq(rs.getString("writer_member_seq"));
				dto2.setRead_image(rs.getString("read_image"));
				dto2.setRead_name(rs.getString("read_name"));
				dto2.setWriter_image(rs.getString("writer_image"));
				dto2.setWriter_name(rs.getString("writer_name"));
				dmlist.add(dto2);

			}

			return dmlist;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 내가 속한 리그 일정 조회
	public ArrayList<LeagueDTO> leaguelist(String seq) {
		try {
			String sql = "select rownum as rnum, lg.seq as seq, to_char(lg.gamedate, 'yyyy-mm-dd') as gamedate, gr.address as ground, (select name from tblteam where seq = lg.awayteam_seq) as awayname"
					+ "  from TBLLEAGUEGAME lg" + "    inner join tblteamentry te on te.seq = lg.hometeam_seq"
					+ "        inner join tblteam t on t.seq = te.team_seq"
					+ "            left join tbltransfer ts on ts.team_seq = t.seq"
					+ "                inner join tblmember m on m.seq = ts.member_seq"
					+ "                    inner join TBLMEMBER_TEAM mt on ts.seq = mt.transfer_Seq"
					+ "                        inner join TBLPLAYERENTRY pl on pl.member_team_seq = mt.seq"
					+ "                            inner join tblground gr on gr.seq = lg.ground_seq"
					+ "                                where pl.league_seq=? and lg.league_seq =? and m.seq=? order by lg.seq desc";

			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, 3);
			pstat.setInt(2, 3);
			pstat.setString(3, seq);

			rs = pstat.executeQuery();
			ArrayList<LeagueDTO> leaguelist = new ArrayList<LeagueDTO>();

			while (rs.next()) {
				LeagueDTO dto3 = new LeagueDTO();
				dto3.setRnum(rs.getString("rnum"));
				dto3.setSeq(rs.getString("seq"));
				dto3.setGameDate(rs.getString("gamedate"));
				dto3.setGround(rs.getString("ground"));
				dto3.setAwayName(rs.getString("awayname"));

				leaguelist.add(dto3);

			}
			return leaguelist;
		} catch (Exception e) {
			e.printStackTrace();

		}

		return null;
	}

	// 내가 팔로우하는 친구 목록 조회
	public ArrayList<FriendsDTO> followingList(String seq) {
		try {

			String sql = "select f.seq, f.follow__member_seq as following_seq, f.follower__member_seq as me_seq, (select name from tblmember where seq = f.follow__member_seq) as followingName, (select image from tblmember where seq = f.follow__member_seq) as followingImage from tblfriends f inner join tblmember m on f.follower__member_seq = m.seq where m.seq = "
					+ seq;

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			ArrayList<FriendsDTO> followingList = new ArrayList<FriendsDTO>();

			while (rs.next()) {
				FriendsDTO dto = new FriendsDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setFollowing_seq(rs.getString("following_seq"));
				dto.setFollowingName(rs.getString("followingName"));
				dto.setFollowingImage(rs.getString("followingImage"));
				followingList.add(dto);
			}

			return followingList;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 나를 팔로우 하는 친구 목록 조회
	public ArrayList<FriendsDTO> followerList(String seq) {
		try {
			String sql = "select f.seq, f.follow__member_seq as me_seq , f.follower__member_seq as follower_seq, (select name from tblmember where seq = f.follower__member_seq) as followerName ,(select image from tblmember where seq = f.follower__member_seq) as followerImage from tblfriends f inner join tblmember m on f.follow__member_seq = m.seq where m.seq ="
					+ seq;

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			ArrayList<FriendsDTO> followerList = new ArrayList<FriendsDTO>();

			while (rs.next()) {
				FriendsDTO dto = new FriendsDTO();
				dto.setFollower_seq(rs.getString("follower_seq"));
				dto.setFollowerName(rs.getString("followerName"));
				dto.setFollowerImage(rs.getString("followerImage"));
				followerList.add(dto);
			}

			return followerList;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	// 나를 팔로우 하는 친구를 follow버튼 누르면 following 목록에 친구 추가
	public int follow(FriendsDTO dto, String seq) {
		try {
			String sql = "insert into tblfriends values(friends_seq.nextVal,?,?)";
//			System.out.println(dto.getFollower_seq());
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getFollower_seq());
			pstat.setString(2, seq);

			return pstat.executeUpdate();// 성공하면 1

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;// 실패하면 0 을 반환함
	}
//	팔로우취소
	public int unfollow(FriendsDTO dto, String seq) {

		try {
			String sql = "delete from tblfriends where follower__member_seq = ? and follow__member_seq =? ";
//			System.out.println(dto.getFollower_seq());
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, dto.getFollowing_seq());

			return pstat.executeUpdate();// 성공하면 1

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

		// 회원정보 수정할 정보 가져오기
	public MypageDTO getInfo(MypageDTO dto2) {
		try {
			String sql = "select m.name,m.image, mt.height,mt.weight from tblmember m "
					+ "inner join tbltransfer ts on m.seq = ts.member_seq "
					+ "    inner join tblmember_team mt on ts.seq = mt.transfer_seq where m.seq = " + dto2.getSeq();

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				MypageDTO dto = new MypageDTO();
				dto.setName(rs.getString("name"));
				dto.setImage(rs.getString("image"));
				dto.setHeight(rs.getString("height"));
				dto.setWeight(rs.getString("weight"));
				return dto;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

//회원 정보수정
	public int infoUpdate(MypageDTO dto2) {
		try {

			String sql = "update tblmember_team SET height =? ,weight=? where transfer_seq = (select seq from tbltransfer where member_seq = ?)";
			String sql2 = "update tblmember set image =? where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getHeight());
			pstat.setString(2, dto2.getWeight());
			pstat.setString(3, dto2.getSeq());

			pstat2 = conn.prepareStatement(sql2);
			pstat2.setString(1, dto2.getImage());
			pstat2.setString(2, dto2.getSeq());

			return pstat.executeUpdate() + pstat2.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	// 회원 탈퇴 기능
	public int memberDelete(MypageDTO dto) {

		try {
			
			String sql = "update tblmember set stat = 0 where seq = " + dto.getSeq();
			stat = conn.createStatement();
			return stat.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	// 소속구단의 경기 전적 가져오기
	public ArrayList<LeagueDTO> matchResult(String seq) {
		try {
			String sql = "select * from vwbroadcastschedule where gamedate < sysdate and hometeam_seq=(select team_Seq from vwmemberinfo where seq=?) order by seq desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();

			ArrayList<LeagueDTO> matchResult = new ArrayList<LeagueDTO>();

			while (rs.next()) {
				LeagueDTO dto = new LeagueDTO();
				dto.setGameDate(rs.getString("gamedate"));
				dto.setAwayName(rs.getString("awayteam"));
				dto.setGround(rs.getString("ground"));
				dto.setHomeGoal(rs.getString("homegoal"));
				dto.setAwayGoal(rs.getString("awaygoal"));
				matchResult.add(dto);
			
			}
			return matchResult;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	//이적 데이터 가져오기
	public ArrayList<LeagueDTO> transfer(String seq) {
		try {
			String sql ="select * from vwtransfer where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();

			ArrayList<LeagueDTO> transfer = new ArrayList<LeagueDTO>();
			while (rs.next()) {
				LeagueDTO dto = new LeagueDTO();
				dto.setTeam(rs.getString("team"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCompleteDate(rs.getString("completedate"));
				dto.setState(rs.getString("state"));
				transfer.add(dto);
			}
			return transfer;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	//랭킹가져오기
	public RankDTO ranklist(String seq) {
		try {
			
			//가져오는 값
			//select vw.sumrecord, rank() OVER(order by vw.sumrecord desc) as ranking, m.seq as member_seq, pl.league_seq 

			//각 회차별로 랭킹 
			String sql1 = "select * from vwpersonalranking1 where member_seq =?";
			String sql2 = "select * from vwpersonalranking2 where member_seq =?";
			String sql3 = "select * from vwpersonalranking3 where member_seq =?";
			pstat = conn.prepareStatement(sql1);
			pstat.setString(1, seq);
			
			pstat2 = conn.prepareStatement(sql2);
			pstat2.setString(1, seq);
			
			pstat3 = conn.prepareStatement(sql3);
			pstat3.setString(1, seq);
			
			rs = pstat.executeQuery();
			rs2 = pstat2.executeQuery();
			rs3 = pstat3.executeQuery();
			
			RankDTO dto = new RankDTO(); 
			ArrayList<RankDTO> ranklist = new ArrayList<RankDTO>(); 
			
			if(rs.next()) {
				dto.setSeq(rs.getString("member_seq"));
				dto.setRanking1(rs.getString("ranking"));
//				ranklist.add(dto);
			}
			if(rs2.next()) {
				dto.setRanking2(rs2.getString("ranking"));
//				ranklist.add(dto);
			}
			if(rs3.next()) {
				dto.setRanking3(rs3.getString("ranking"));
//				ranklist.add(dto);
			}
//			
//			System.out.println(dto.getRanking1());
//			System.out.println(dto.getRanking2());
//			System.out.println(dto.getRanking3());
			
			return dto;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
//	public LeagueDTO teamrank(String seq) {
//		try {
//			String sql = "select distinct * from vwteamaRank  where rownum <=11 order by points desc";
//			stat = conn.createStatement();
//			rs = stat.executeQuery(sql);
//			
//			
//			ArrayList<TeamDTO> list = new ArrayList<TeamDTO>();
//			
//			
//			while(rs.next()) {
//				
//				TeamDTO dto = new TeamDTO();
//				
//				dto.setTeamName(rs.getString("name"));
//				dto.setPoints(rs.getString("points"));
//				
//				
//				list.add(dto);
//			}
//			
//			return list;
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		return null;
//	}

}
