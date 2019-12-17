package com.mid.pro.model;

public class TableViewVO {
	//예약시 보여주는 테이블
	private int rev_time; // 예약 시간저장
	private int table_num; // 테이블 번호
	private int table_user; // 테이블 인원수
	private int rev_min; // 분 단위 저장
	
	public int getRev_time() {
		return rev_time;
	}
	public void setRev_time(int rev_time) {
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
	public int getRev_min() {
		return rev_min;
	}
	public void setRev_min(int rev_min) {
		this.rev_min = rev_min;
	}
	
	
}
