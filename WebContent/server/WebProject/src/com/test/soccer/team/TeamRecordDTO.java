package com.test.soccer.team;

public class TeamRecordDTO {

	private String search; // 검색어
	private String selectKeyword; // 검색 키워드
	private String selectrow; // 페이지당 출력 갯수

	private String match_seq; // 친선경기번호
	
	private String league;//리그명
	private String awayName;// 상대팀 이름
	private String homeName;
	private String seq; // game seq
	private String gameDate; // 경기일정
	private String ground; // 홈구장
	private String rnum;
	private String homeGoal;// 홈골
	private String awayGoal;// 어웨이골

	private String team; // 이적한 팀이름
	private String regdate; // 이적신청날짜
	private String completeDate; // 처리날짜
	private String state; // 상태

	private String teamranking1;// 1리그 팀순위
	private String teamranking2;// 2리그 팀순위
	private String teamranking3;// 3리그 팀순위

	
	private String lat;
	private String lng;
	
	public String getAwayName() {
		return awayName;
	}

	public void setAwayName(String awayName) {
		this.awayName = awayName;
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

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getSelectKeyword() {
		return selectKeyword;
	}

	public void setSelectKeyword(String selectKeyword) {
		this.selectKeyword = selectKeyword;
	}

	public String getSelectrow() {
		return selectrow;
	}

	public void setSelectrow(String selectrow) {
		this.selectrow = selectrow;
	}

	

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getMatch_seq() {
		return match_seq;
	}

	public void setMatch_seq(String match_seq) {
		this.match_seq = match_seq;
	}

	public String getHomeName() {
		return homeName;
	}

	public void setHomeName(String homeName) {
		this.homeName = homeName;
	}

	public String getLeague() {
		return league;
	}

	public void setLeague(String league) {
		this.league = league;
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
