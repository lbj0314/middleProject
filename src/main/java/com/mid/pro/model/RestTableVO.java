package com.mid.pro.model;

public class RestTableVO {
	
	private int table_num; // 테이블 번호
	private int table_user; // 테이블 인원수
	private String open_time; // 오픈 시간
	private String close_time; // 클로즈시간
	private int rest_num; //가게 번호
	private int member_num; // 회원 번호
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
	
	
}
