package com.mid.pro.model;

public class Reservation2VO {
	
	private int rev_num; //예약 번호
	private String member_name; //예약자 이름
	private int member_num; //예약자 번호
	private int rest_num; //가게 번호
	private String rest_name; //가게 이름
	private String rest_tel; //가게 전화번호
	private String rest_addr1; // 가게주소
	private String rev_time; // 예약 시간
	private String rev_month; // 예약 월
	private String rev_day; // 예약 일
	private String rev_date; // 예약 날짜
	private int table_num; // 테이블 번호
	
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getRest_num() {
		return rest_num;
	}
	public void setRest_num(int rest_num) {
		this.rest_num = rest_num;
	}
	public String getRest_name() {
		return rest_name;
	}
	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}
	public String getRest_tel() {
		return rest_tel;
	}
	public void setRest_tel(String rest_tel) {
		this.rest_tel = rest_tel;
	}
	public String getRest_addr1() {
		return rest_addr1;
	}
	public void setRest_addr1(String rest_addr1) {
		this.rest_addr1 = rest_addr1;
	}
	public String getRev_time() {
		return rev_time;
	}
	public void setRev_time(String rev_time) {
		this.rev_time = rev_time;
	}
	public String getRev_month() {
		return rev_month;
	}
	public void setRev_month(String rev_month) {
		this.rev_month = rev_month;
	}
	public String getRev_day() {
		return rev_day;
	}
	public void setRev_day(String rev_day) {
		this.rev_day = rev_day;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	public int getTable_num() {
		return table_num;
	}
	public void setTable_num(int table_num) {
		this.table_num = table_num;
	}
}
