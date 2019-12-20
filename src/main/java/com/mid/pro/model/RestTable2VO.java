package com.mid.pro.model;

public class RestTable2VO {
	
	private int table_num; // 테이블 번호
	private int table_user; // 테이블 인원수
	private String open_time; // 오픈 시간
	private String close_time; // 클로즈시간
	private int rest_num; //가게 번호
	private int member_num; // 회원 번호
	
	//JOIN
	private String rev_time;//예약한 시간
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
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getClose_time() {
		return close_time;
	}
	public void setClose_time(String close_time) {
		this.close_time = close_time;
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
	public String getRev_time() {
		return rev_time;
	}
	public void setRev_time(String rev_time) {
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
