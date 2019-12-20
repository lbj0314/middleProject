package com.mid.pro.model;

public class TableViewVO {
	//예약시 보여주는 테이블
	private String rev_time; // 예약 시간저장
	private int table_num; // 테이블 번호
	private int table_user; // 테이블 인원수
	
	public String getRev_time() {
		return rev_time;
	}
	public void setRev_time(String rev_time) {
		this.rev_time = rev_time;
	}
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
}
