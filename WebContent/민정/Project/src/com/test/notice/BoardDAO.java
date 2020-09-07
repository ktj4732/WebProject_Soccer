package com.test.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class BoardDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
		DBUtil util =new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> list(HashMap<String, String> map){
		
		try {
			//목록 or 검색
			String where = "";
			
			if(map.get("search")!= null && map.get("searchKeyWord")!=null) {
				//이름 & 제목 & 내용 - 포괄검색
				where = String.format("where %s like '%%%s%%'  ", map.get("searchKeyWord"),  map.get("search"));
			}
		
		String sql = String.format(
				"select * from (select notice.* , rownum as rnum from (select n.seq as seq, a.name as name, n.title as title, n.content as content, n.regdate as regdate, n.readcount as readcount from tblnotice n inner join tbladmin a on a.seq = n.admin_seq order by %s asc) notice %s) where rnum>= %s and rnum<= %s  order by %s asc",
				map.get("sort"),where ,
				map.get("begin"),map.get("end"),
				 map.get("sort"));	
			
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		//rs -> list 복사
		while(rs.next()) {
			//레코드 1줄 -> BoardDTO 1개
			BoardDTO dto = new BoardDTO();
			
			dto.setSeq(rs.getString("seq"));
			dto.setAdmin_name(rs.getString("name"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setRegdate(rs.getDate("regdate"));
			dto.setReadcount(rs.getInt("readcount"));
			
			list.add(dto);
		}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
		
	}

	public int getTotalCount(HashMap<String, String> map) {
		try {
			String where = "";
			if(map.get("search") != null) {
				//제목, 내용 검색
				where = String.format("where title like '%%%s%%'  or content like '%%%s%%'", map.get("search"),  map.get("search"));
			}
			if(map.get("search")!= null && map.get("searchKeyWord")!=null) {
				//이름 & 제목 & 내용 - 포괄검색
				where = String.format("where %s like '%%%s%%'  ", map.get("searchKeyWord"),  map.get("search"));
			}
			String sql = String.format("select count(*) as cnt from tblnotice %s", where);
			
		
			
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			System.out.println("success");
			if(rs.next()) {
				return rs.getInt("cnt");
				
			}
		} catch (Exception e) {
			System.out.println("boardDAO.getTotalCount()");
			e.printStackTrace();
		}
		return 0;
	}

	//조회수 +1
	public void updateReadcount(String seq) {

		try {

			String sql = "update vwnotice set readcount = readcount + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			

		} catch (Exception e) {
			System.out.println("BoardDAO.updateReadcount()");
			e.printStackTrace();
		}
		
	}

	//View 서블릿 >> 글번호를 주고 게시물 1개를 반환받기 위해 위임
	public BoardDTO get(BoardDTO dto2) {
		
		try {
			//String sql1 = "select a.*,(select name from tblAdmin where seq= a.admin_seq) as name from tblnotice a where seq = ?";
			String sql2 = "select n.seq as seq, a.name as name, n.title as title, n.content as content, n.regdate as regdate, n.readcount as readcount, (select name from tblAdmin a where a.seq = n.admin_seq) as name from tblnotice n inner join tblAdmin a on n.admin_seq = a.seq where n.seq = ? ";
			//String sql = "select a.* from vwnotice a where a.seq = ?";	 
			
			pstat = conn.prepareStatement(sql2);
			pstat.setString(1, dto2.getSeq());//글번호
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));//글번호
				dto.setTitle(rs.getString("title"));//제목
				dto.setContent(rs.getString("content"));//내용
				dto.setRegdate(rs.getDate("regdate"));//날짜
				dto.setReadcount(rs.getInt("readcount"));//조회수
//				dto.setAdmin_name(rs.getString("name"));//이름
				dto.setAdmin_name(rs.getString("name"));
//				dto.setAdmin_seq(rs.getString("admin_seq"));//관리자번호
				
				System.out.println("boardDAO.get() 성공");
				
				return dto;
				
			}
		} catch (Exception e) {
			System.out.println("boardDAO.get()");
			e.printStackTrace();
		}
		return null;
	}

	public int write(BoardDTO dto) {	//새 공지 쓰기

		try {
			
			//- \r\n 삭제
			//- 마지막 ; 삭제
			String sql = "insert into tblNotice (seq, admin_seq, title, content, regdate, readcount) values(NOTICE_SEQ.nextVal,1,?,?,TO_DATE(sysdate,'YY/MM/DD'),0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());

			return pstat.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("BoardDAO.write() error");
			e.printStackTrace();
		} 
		return 0;
	}

	public boolean isOwner(BoardDTO dto2) {
		// TODO Auto-generated method stub
		return false;
	}

	public int edit(BoardDTO dto) {// 공지글 수정
		
		try {
			
			String sql = "update tblNotice set title=? , content = ? where seq = ?";
			
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
}
