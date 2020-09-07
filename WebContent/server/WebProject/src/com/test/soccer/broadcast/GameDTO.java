package com.test.soccer.broadcast;

public class GameDTO {
	private String teamname;
	private String league_seq;
	private String leaguegame_seq;
	
	public String getLeaguegame_seq() {
		return leaguegame_seq;
	}
	public void setLeaguegame_seq(String leaguegame_seq) {
		this.leaguegame_seq = leaguegame_seq;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getLeague_seq() {
		return league_seq;
	}
	public void setLeague_seq(String league_seq) {
		this.league_seq = league_seq;
	}
	
	
}
