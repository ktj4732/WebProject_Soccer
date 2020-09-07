package com.test.soccer.team;

public class TeamlistDTO {
	//--seq, logo, name, coachname, birth, count, ground, lat,lng, points,league_seq
	private String team_seq;
	
	private String logo;
	private String name;
	private String coachname;
	private String birth;
	private String count;
	private String ground;
	private String lat;
	private String lng;
	private String points;
	private String league_seq;
	
	private String rnum;
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getTeam_seq() {
		return team_seq;
	}
	public void setTeam_seq(String team_seq) {
		this.team_seq = team_seq;
	}
	
	public String getPoints() {
		return points;
	}
	public void setPoints(String points) {
		this.points = points;
	}
	public String getLeague_seq() {
		return league_seq;
	}
	public void setLeague_seq(String league_seq) {
		this.league_seq = league_seq;
	}
	
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCoachname() {
		return coachname;
	}
	public void setCoachname(String coachname) {
		this.coachname = coachname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	
}
