package com.test.soccer.member;

public class TeamDTO {
	
	private String teamName;	//팀명
	private String points;		//팀승점
	
	private String memberName;	//플레이어명
	private String goal;		//골
	private String assist;		//도움
	private String tackle;		//태클성공
	private String save; 		//세이브
	private String yellowCard;	//경고
	private String foul;		//파울
	
	private String league;		//리그명
	private String gamedate;	//경기날짜
	private String ground;		//경기장
	private String hometeam;	//홈팀
	private String homelogo;	//홈팀 로고
	private String awayteam;	//어웨이팀
	private String awaylogo;	//어웨이팀 로고
	private String mseq;		//플레이어번호
	
	
	public String getLeague() {
		return league;
	}
	public void setLeague(String league) {
		this.league = league;
	}
	public String getGamedate() {
		return gamedate;
	}
	public void setGamedate(String gamedate) {
		this.gamedate = gamedate;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public String getHometeam() {
		return hometeam;
	}
	public void setHometeam(String hometeam) {
		this.hometeam = hometeam;
	}
	public String getHomelogo() {
		return homelogo;
	}
	public void setHomelogo(String homelogo) {
		this.homelogo = homelogo;
	}
	public String getAwayteam() {
		return awayteam;
	}
	public void setAwayteam(String awayteam) {
		this.awayteam = awayteam;
	}
	public String getAwaylogo() {
		return awaylogo;
	}
	public void setAwaylogo(String awaylogo) {
		this.awaylogo = awaylogo;
	}
	public String getAssist() {
		return assist;
	}
	public void setAssist(String assist) {
		this.assist = assist;
	}
	public String getTackle() {
		return tackle;
	}
	public void setTackle(String tackle) {
		this.tackle = tackle;
	}
	public String getSave() {
		return save;
	}
	public void setSave(String save) {
		this.save = save;
	}
	public String getFoul() {
		return foul;
	}
	public void setFoul(String foul) {
		this.foul = foul;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getPoints() {
		return points;
	}
	public void setPoints(String points) {
		this.points = points;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getYellowCard() {
		return yellowCard;
	}
	public void setYellowCard(String yellowCard) {
		this.yellowCard = yellowCard;
	}
	public String getMseq() {
		return mseq;
	}
	public void setMseq(String mseq) {
		this.mseq = mseq;
	}
	
	
	

}
