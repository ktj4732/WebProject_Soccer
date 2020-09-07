package com.test.soccer.broadcast;

public class PlayerInformationDTO {

	private String member_seq;
	private String height;
	private String weight;
	private String teamname;
	private String playername;
	private String backnumber;
	private String position;
	private String playerimage;
	private String birth;
	private String completedate;
	
	//broadcast 부분에서 추가된 부분

	private String league_seq;
	private String teamlogo;
	private String playerentry_seq;
	
	
	public String getPlayerentry_seq() {
		return playerentry_seq;
	}
	public void setPlayerentry_seq(String playerentry_seq) {
		this.playerentry_seq = playerentry_seq;
	}
	
	public String getTeamlogo() {
		return teamlogo;
	}
	public void setTeamlogo(String teamlogo) {
		this.teamlogo = teamlogo;
	}
	public String getLeague_seq() {
		return league_seq;
	}
	public void setLeague_seq(String league_seq) {
		this.league_seq = league_seq;
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
