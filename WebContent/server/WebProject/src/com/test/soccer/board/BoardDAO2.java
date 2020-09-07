	package com.test.soccer.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;

public class BoardDAO2 {

	

		private Connection conn;
		private Statement stat;
		private PreparedStatement pstat;
		private ResultSet rs;
		
		public BoardDAO2() {
			//DB연결
			DBUtil util = new DBUtil();
			conn = util.open();
		}
		
		public void close() {
			try {
				
			} catch (Exception e) {
		
				e.printStackTrace();
			}
		}
		
		//페이징에 필요한 총 게시물 수를 가져오는 메소드
		public int getTotalCount(HashMap<String, String> map) {

			try {
				String where = "";
				String whereTemp = "";
				String search = map.get("search");
				String selectKeyword = map.get("selectKeyword");
				String category = map.get("category");
				// 목록 or 검색
				if(search!=null) {
					
					where= String.format("and %s like '%%%s%%'", selectKeyword , search);
				
					if(selectKeyword.equals("title_content")) { //제목 + 내용 검색 일때
						
						 selectKeyword = "title";//제목 + 내용 검색 일때
						 
						 whereTemp = String.format("and %s like '%%%s%%'", selectKeyword , search);
						 
						 selectKeyword = "content";
						 
						 where = String.format("and %s like '%%%s%%' %s", selectKeyword, search, whereTemp);		
						 
						}	
				
				}
				String sql = String.format("select count(*) as cnt from tblboard b inner join tblMember m on m.seq = b.member_seq where category_seq = %s %s and b.regdate<sysdate", category ,where);
					
				stat = conn.createStatement();					
				rs = stat.executeQuery(sql);
				
				if(rs.next()) {
					return rs.getInt("cnt");
				}
				
				
			} catch (Exception e) {
			e.printStackTrace();
			}
			
			
			
			return 0;
		}

		//friendylrecruit (게시판 리스트 출력하기)
		public ArrayList<BoardDTO2> list(HashMap<String, String> map) {
			try {
				
				String where = "";
				String whereTemp = "";
				String begin = map.get("begin");
				String end = map.get("end");
				String category = map.get("category");
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
				
				String sql = String.format("select * from (select a.*, rownum as rnum from (select * from tblBoard b inner join tblMember m on m.seq = b.member_seq where category_seq = %s %s and b.regdate<sysdate order by b.seq desc ) a) where rnum >= %s and rnum <= %s",category, where, begin, end);
					
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				ArrayList<BoardDTO2> list = new ArrayList<BoardDTO2>();
				while(rs.next()) {
					//레코드 1줄 -> boardDTO 1개
					BoardDTO2 dto = new BoardDTO2();
					dto.setSeq(rs.getString("seq"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setReadcount(rs.getInt("readcount"));
//					dto.setGap(rs.getInt("gap"));
					dto.setName(rs.getString("name"));
					dto.setCategory_seq(rs.getString("category_seq"));
					list.add(dto);
				}
				return list;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return null;
		}
		//조회수 증가
		public void updateReadCount(String seq) {
			try {
				String sql = "update tblBoard set readcount = readcount+1 where seq=?";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, seq);
				pstat.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();

			}

		}
		//게시판 글 내용 가져오기
		public BoardDTO2 get(BoardDTO dto2) {
			try {

				String sql = "select a.*, (select name from tblmember where seq = a.member_seq) as name, (select id from tblmember where seq = a.member_seq) as id from tblBoard a where seq = ?";
				pstat = conn.prepareStatement(sql);					
				pstat.setString(1, dto2.getSeq());  //글번호
				
				rs = pstat.executeQuery();
				
				if (rs.next()) {
					
					BoardDTO2 dto = new BoardDTO2();
					dto.setSeq(rs.getString("seq"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setMember_seq(rs.getString("member_seq"));
					dto.setOrgfilename(rs.getString("image"));
					dto.setName(rs.getString("name"));
					dto.setId(rs.getString("id"));
					dto.setMatch_seq(rs.getString("match_seq"));
					return dto;
					
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
				

			}
			return null;
		}

		public int apply(String seq, String board_seq) {
			try {
				String sql ="insert into tblapplymatch values(applymatch_seq.nextVal,?,?,default)";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, board_seq);
				pstat.setString(2, seq);
				
				return pstat.executeUpdate();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			return 0;
		}

	

}
