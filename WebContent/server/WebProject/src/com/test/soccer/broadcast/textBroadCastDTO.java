package com.test.soccer.broadcast;

public class textBroadCastDTO {

	private String leaguegame_seq; 
	private String time;
	private String event;
	private String backnumber;
	private String playername;
	private String teamname;
	
	
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	private String position;
	public String getLeaguegame_seq() {
		return leaguegame_seq;
	}
	public void setLeaguegame_seq(String leaguegame_seq) {
		this.leaguegame_seq = leaguegame_seq;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getBacknumber() {
		return backnumber;
	}
	public void setBacknumber(String backnumber) {
		this.backnumber = backnumber;
	}
	public String getPlayername() {
		return playername;
	}
	public void setPlayername(String playername) {
		this.playername = playername;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	
	
}
