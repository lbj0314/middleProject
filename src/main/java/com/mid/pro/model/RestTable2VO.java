package com.mid.pro.model;

public class RestTable2VO {
	
	private int table_num; // 테이블 번호
	private int table_user; // 테이블 인원수
	private String open_time1; // 오픈 시간1
	private String close_time1; // 클로즈시간1
	private String open_time2; //오픈 시간2
	private String close_time2; // 클로즈 시간2
	private int rest_num; //가게 번호
	private int member_num; // 회원 번호
	
	//JOIN
	private Integer rev_time;//예약한 시간
	private String rev_date;//예약한 날짜
	private String rev_table;//예약한 테이블번호
	
	public int getTable_num() {
		return table_num;
	}
	public void setTable_num(int table_num) {
		this.table_num = table_num;
	}
	public int getTable_user() {
		return table_user;
	}
	public void setTable_user(int table_user) {
		this.table_user = table_user;
	}
	public String getOpen_time1() {
		return open_time1;
	}
	public void setOpen_time1(String open_time1) {
		this.open_time1 = open_time1;
	}
	public String getClose_time1() {
		return close_time1;
	}
	public void setClose_time1(String close_time1) {
		this.close_time1 = close_time1;
	}
	public String getOpen_time2() {
		return open_time2;
	}
	public void setOpen_time2(String open_time2) {
		this.open_time2 = open_time2;
	}
	public String getClose_time2() {
		return close_time2;
	}
	public void setClose_time2(String close_time2) {
		this.close_time2 = close_time2;
	}
	public int getRest_num() {
		return rest_num;
	}
	public void setRest_num(int rest_num) {
		this.rest_num = rest_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public Integer getRev_time() {
		return rev_time;
	}
	public void setRev_time(Integer rev_time) {
		this.rev_time = rev_time;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	public String getRev_table() {
		return rev_table;
	}
	public void setRev_table(String rev_table) {
		this.rev_table = rev_table;
	}
	
	
	
}
