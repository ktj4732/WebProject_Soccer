package com.test.project.result_match;

import java.sql.Date;

public class MatchDTO {
	String seq;
	Date matchdate;
	String ground;
	String homeTeam;
	String awayTeam;
	String homeGoal;
	String awayGoal;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public Date getMatchdate() {
		return matchdate;
	}
	public void setMatchdate(Date matchdate) {
		this.matchdate = matchdate;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public String getHomeTeam() {
		return homeTeam;
	}
	public void setHomeTeam(String homeTeam) {
		this.homeTeam = homeTeam;
	}
	public String getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(String awayTeam) {
		this.awayTeam = awayTeam;
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
}
