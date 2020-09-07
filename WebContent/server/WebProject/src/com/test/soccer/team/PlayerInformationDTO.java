package com.test.soccer.team;

public class PlayerInformationDTO {
/*
 mt.seq member_Seq, mt.backnumber backnumber, mt.height height,
     mt.weight weight, position.position position, member.name playername,
     member.image playerimage, to_char(member.birth,'yyyymmdd') birth,
     team.name teamname, to_char(transfer.completedate,'yyyymmdd') completedate
 */
	private String member_seq;
	private String backnumber;
	private String height;
	private String weight;
	private String position;
	private String playername;
	private String playerimage;
	private String birth;
	private String teamname;
	private String completedate;
	
	private String mseq;
	
	public String getMseq() {
		return mseq;
	}
	public void setMseq(String mseq) {
		this.mseq = mseq;
	}
	public String getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(String member_seq) {
		this.member_seq = member_seq;
	}
	public String getBacknumber() {
		return backnumber;
	}
	public void setBacknumber(String backnumber) {
		this.backnumber = backnumber;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPlayername() {
		return playername;
	}
	public void setPlayername(String playername) {
		this.playername = playername;
	}
	public String getPlayerimage() {
		return playerimage;
	}
	public void setPlayerimage(String playerimage) {
		this.playerimage = playerimage;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getCompletedate() {
		return completedate;
	}
	public void setCompletedate(String completedate) {
		this.completedate = completedate;
	}
	
	
	
}
