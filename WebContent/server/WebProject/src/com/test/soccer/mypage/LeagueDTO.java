package com.test.soccer.mypage;

public class LeagueDTO {
	
	private String awayName;//상대팀 이름 
	
	private String seq; //game seq
	private String gameDate; //경기일정
	private String ground; //홈구장
	private String rnum;
	private String homeGoal;//홈골
	private String awayGoal;//어웨이골
	
	
	private String team; //이적한 팀이름
	private String regdate; //이적신청날짜
	private String completeDate; //처리날짜
	private String state; //상태
	
	
	private String teamranking1;//1리그 팀순위
	private String teamranking2;//2리그 팀순위
	private String teamranking3;//3리그 팀순위
	
	
	
	public String getTeamranking1() {
		return teamranking1;
	}
	public void setTeamranking1(String teamranking1) {
		this.teamranking1 = teamranking1;
	}
	public String getTeamranking2() {
		return teamranking2;
	}
	public void setTeamranking2(String teamranking2) {
		this.teamranking2 = teamranking2;
	}
	public String getTeamranking3() {
		return teamranking3;
	}
	public void setTeamranking3(String teamranking3) {
		this.teamranking3 = teamranking3;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getCompleteDate() {
		return completeDate;
	}
	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getHomeGoal() {
		return homeGoal;
	}
	public void setHomeGoal(String homeGoal) {
		this.homeGoal = homeGoal;
	}
	public String getAwayGoal() {
		return awayGoal;
	}
	public void setAwayGoal(String awayGoal) {
		this.awayGoal = awayGoal;
	}
	public String getAwayName() {
		return awayName;
	}
	public void setAwayName(String awayName) {
		this.awayName = awayName;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getGameDate() {
		return gameDate;
	}
	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	
}
