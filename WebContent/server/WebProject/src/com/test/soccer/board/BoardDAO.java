package com.test.soccer.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;

public class BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public BoardDAO() {
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
	
	//오희준
	//communityFreeBulletinBoard 서블릿 -> 게시판 목록 주세요.
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
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
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from tblBoard b inner join tblMember m on m.seq = b.member_seq where category_seq = %s %s order by b.seq desc) a) where rnum >= %s and rnum <= %s",category, where, begin, end);
									
			stat = conn.prepareStatement(sql);			
			rs = stat.executeQuery(sql);
						
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				
				// 레코드 1줄 -> BoardDTO 1개
				BoardDTO dto = new BoardDTO();
				
				
				dto.setSeq(rs.getString("seq"));				//번호
				dto.setTitle(rs.getString("title"));			//제목
				dto.setContent(rs.getString("content"));		//내용
				dto.setRegdate(rs.getString("regdate"));		//등록일
				dto.setReadcount(rs.getInt("readcount"));		//조회수
				dto.setCategory_seq(rs.getString("category_seq"));	//게시판 카테고리번호
				dto.setMember_seq(rs.getString("member_seq"));	//회원 번호
				dto.setImage(rs.getString("image"));			//이미지
				dto.setName(rs.getString("name"));				//회원이름
				
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("BoardDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}

	
	//오희준
	//communityFreeBulletinBoard 서블릿 -> 페이지(총 게시글 수)
	public int getTotalCount(HashMap<String, String> map) {
				
		try {
			
			String where = "";
			String whereTemp = "";
			
			String search = map.get("search");
			String selectKeyword = map.get("selectKeyword");
			
			String category = map.get("category");
			
			//검색어가 있을때
			if (search != null) {
				 where = String.format("and %s like '%%%s%%'", selectKeyword , search);
		
				if(selectKeyword.equals("title_content")) { //제목 + 내용 검색 일때
				
				 selectKeyword = "title";//제목 + 내용 검색 일때
				 
				 whereTemp = String.format("and %s like '%%%s%%'", selectKeyword , search);
				 
				 selectKeyword = "content";
				 
				 where = String.format("and %s like '%%%s%%' %s", selectKeyword, search, whereTemp);		
				 
				}	
				
			} 
			
			//else if (search.equals("")) { //처음 게시판에 들어왔을때 검색어가 없어 null오류가 떠서 했음
			// where = "";
			//}
			
			String sql = String.format("select count(*) as cnt from tblboard b inner join tblMember m on m.seq = b.member_seq where category_seq = %s %s", category ,where);
	
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

	//오희준
	//BulletinBoardContent 서블릿 -> 조회수 증가
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
	

	//오희준
	//BulletinBoardContent 서블릿 -> 댓글 목록 가져오기
	public ArrayList<CommentDTO> listComment(String seq) {
	
		try {
			
			String sql =  String.format("select *, (select name from tblMember where seq = tblcomment.member_seq) as name from tblcomment where board_seq = %s");
			stat = conn.createStatement();
			rs  = stat.executeQuery(sql);
			
			ArrayList<CommentDTO> clist = new ArrayList<CommentDTO>();
			
			while(rs.next()) {
				// 레코드 1줄 -> BoardDTO 1개
				CommentDTO dto = new CommentDTO();
			
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setMember_seq(rs.getString("member_seq"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));

				clist.add(dto);
			
			}
			return clist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	

	
	
	//오희준
	//BulletinBoardContent 서블릿 -> 글번호 주고 게시물 받아오기
	public BoardDTO content(BoardDTO dto2) {
		
		try {
			
//			String sql = select 
			String sql = "select a.*, (select name from tblmember where seq = a.member_seq) as name, (select id from tblmember where seq = a.member_seq) as id from tblBoard a where seq = ?";
			
			
			pstat = conn.prepareStatement(sql);			
			//pstat.setString(1, dto2.getMember_seq()); //회원번호			
			pstat.setString(1, dto2.getSeq());  //글번호
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setMember_seq(rs.getString("member_seq"));
				
				dto.setOrgfilename(rs.getString("image"));
				
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				return dto;
			}
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.content()");
			e.printStackTrace();
			

		}
		
		return null;
	}

	//오희준
	//writingDrawupOk 서블릿 -> 글쓰기
	public int write(BoardDTO dto) {
		
		try {
			
			String sql = String.format("insert into tblBoard (seq, title, content, regdate, readcount, image, member_seq, category_seq) values (board_seq.nextval, '%s', '%s', default, 0, '%s', %s, %s )"
																, dto.getTitle()
																, dto.getContent()
																, dto.getFilename()
																, dto.getMember_seq()
																, dto.getCategory_seq());
			
			stat = conn.createStatement();
			return stat.executeUpdate(sql);
			
		} catch (Exception e) {
			System.out.println("BoardDAO.write()");
			e.printStackTrace();
		}
		
		return 0;
	}

	//오희준
	//EditOk 서블릿 -> 글쓴이 인지 확인
	public boolean isOwner(BoardDTO dto2) {
		
		try {
			
			String sql = "select count(*) as cnt from tblBoard a where (select id from tblMember where seq = a.member_seq) = ? and seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getId());
			pstat.setString(2, dto2.getSeq());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt") == 1 ? true : false;
			}
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.isOwner()");
			e.printStackTrace();
		}
		
		return false;
	}
	
	//오희준
	//EditOk 서블릿 -> 게시글 수정하기
	public int edit(BoardDTO dto) {
		
		try {
			
			String sql = "update tblBoard set title = ?, content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BoardDAO.edit()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delete(String seq) {
		
		try {
			
			String sql = "delete from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BoardDAO.delete()");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	
	
	
	
	
	
	
}//class
