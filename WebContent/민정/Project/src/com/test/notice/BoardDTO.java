package com.test.notice;

import java.sql.Date;

public class BoardDTO {
	String seq;
	String admin_name;
	String admin_seq;
	String title;
	String content;
	Date regdate;
	int readcount;
	
	public String getAdmin_seq() {
		return admin_seq;
	}
	public void setAdmin_seq(String admin_seq) {
		this.admin_seq = admin_seq;
	}
	public String getSeq() {
		return seq;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}
