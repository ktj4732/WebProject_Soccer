package com.test.soccer;

import java.sql.Connection;
import java.sql.DriverManager;

//JAVA DOC 주석
/**
 * 
 * @author 아무개
 * 오라클 연결 클래스입니다
 * 
 */
public class DBUtil {

	private Connection conn=null;
	/**
	 * 서버에 연결합니다.
	 * @return 연결 객체를 반환합니다.
	 */
	public Connection open() {
		
//		String url="jdbc:oracle:thin:@192.168.0.1:1521:xe";//쌍용학원

		String url="jdbc:oracle:thin:@webproject.c5mw9almbigu.ap-northeast-2.rds.amazonaws.com:1521:aa";//집
		String id="a45hvn";
		String pw="20200804";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url, id, pw);//접속 버튼과 동일
			return conn;

		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}//open
	
	/**
	 * 서버에 연결합니다.
	 * @param host 서버 주소
	 * @param id 계정명
	 * @param pw 비밀번호
	 * @return 연결 객체를 반환합니다.
	 */
	public Connection open(String host, String id, String pw) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url, id, pw);//접속 버튼과 동일
			return conn;

		} catch (Exception e) {
			System.out.println("DBUtil.getConnection()");
			e.printStackTrace();
			// TODO: handle exception
		}
		return null;
	}//open

	/**
	 * 연결을 종료합니다.
	 */
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
	}//close
}//DBUtil
