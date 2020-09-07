package com.test.soccer.mypage;

public class DmDTO {

	private String seq;
	private String content;
	private String regdate;
	private String read_member_seq;
	private String writer_member_seq;
	private String read_name;
	private String read_image;
	private String writer_name;
	private String writer_image;
	
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getWriter_image() {
		return writer_image;
	}
	public void setWriter_image(String writer_image) {
		this.writer_image = writer_image;
	}

	
	public String getRead_name() {
		return read_name;
	}
	public void setRead_name(String reader_name) {
		this.read_name = reader_name;
	}
	public String getRead_image() {
		return read_image;
	}
	public void setRead_image(String image) {
		this.read_image = image;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getRead_member_seq() {
		return read_member_seq;
	}
	public void setRead_member_seq(String read_member_seq) {
		this.read_member_seq = read_member_seq;
	}
	public String getWriter_member_seq() {
		return writer_member_seq;
	}
	public void setWriter_member_seq(String writer_member_seq) {
		this.writer_member_seq = writer_member_seq;
	}
	
	
}
