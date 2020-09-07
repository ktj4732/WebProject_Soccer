package com.test.soccer.board;

public class BoardDTO2 {


	private String seq;				//번호
	private String title;			//제목
	private String content;			//내용
	private String regdate; 		//등록일
	private int readcount; 			//조회수
	private String member_seq; 		//회원번호
	private String category_seq;	//카테고리 번호
	private String image;			//이미지
	
	private String name;			//회원이름	
	private String tel;				//전화번호
	private String position;		//포지션
	
	private String team;
	private int gap;
	
	private String id;				//회원 아이디
	
	private String filename;
	private String orgfilename; 
	
	private String search;			//검색어
	private String selectKeyword;	//검색 키워드
	private String selectrow;		//페이지당 출력 갯수
	
	private String match_seq; 		//친선경기번호
	
	
	
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getOrgfilename() {
		return orgfilename;
	}
	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}
	
	public String getCategory_seq() {
		return category_seq;
	}
	public void setCategory_seq(String category_seq) {
		this.category_seq = category_seq;
	}

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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(String member_seq) {
		this.member_seq = member_seq;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGap() {
		return gap;
	}
	public void setGap(int gap) {
		this.gap = gap;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	
	
}
