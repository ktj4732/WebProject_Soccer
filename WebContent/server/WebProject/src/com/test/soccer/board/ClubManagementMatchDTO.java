package com.test.soccer.board;

public class ClubManagementMatchDTO {

	
	private String seq;//글번호
	private String txtTitle;//말머리
	private String title;//글제목
	private String apply;//작성자
	private String regdate;//신청날짜 
	private String applyteam;//친선경기 신청 팀
	private String apply_seq;//신청번호
	private String rnum;
	private String state;//상태
	
	public String getSeq() {
		return seq;
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
	public String getApply() {
		return apply;
	}
	public void setApply(String apply) {
		this.apply = apply;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getApplyteam() {
		return applyteam;
	}
	public void setApplyteam(String applyteam) {
		this.applyteam = applyteam;
	}
	public String getTxtTitle() {
		return txtTitle;
	}
	public void setTxtTitle(String txtTitle) {
		this.txtTitle = txtTitle;
	}
	public String getApply_seq() {
		return apply_seq;
	}
	public void setApply_seq(String apply_seq) {
		this.apply_seq = apply_seq;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	
	
}
