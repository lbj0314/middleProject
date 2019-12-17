package com.mid.pro.model;

public class ReservationVO {
	
	private int rev_num; //예약 번호
	private int member_num; //예약자 번호
	private String member_name; //예약자 이름
	private String rev_time; // 예약 시간
	private String rest_name; // 가게 이름
	private int rest_num; // 가게 번호
	private int table_num; // 테이블 번호
	private String rev_date; // 예약 날짜
	private int rev_status; //예약 상태
	
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getRev_time() {
		return rev_time;
	}
	public void setRev_time(String rev_time) {
		this.rev_time = rev_time;
	}
	public String getRest_name() {
		return rest_name;
	}
	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}
	public int getRest_num() {
		return rest_num;
	}
	public void setRest_num(int rest_num) {
		this.rest_num = rest_num;
	}
	public int getTable_num() {
		return table_num;
	}
	public void setTable_num(int table_num) {
		this.table_num = table_num;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	public int getRev_status() {
		return rev_status;
	}
	public void setRev_status(int rev_status) {
		this.rev_status = rev_status;
	}
	
	
	
}
