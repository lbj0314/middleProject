package com.mid.pro.model;

import java.sql.Date;

public class ReviewVO {
	
	private int review_num;
	private String writer;
	private int score;
	private String contents;
	private Date reg_date;
	private int member_num;
	private int rest_num;
	private int reviewAvgScore;
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
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
	public int getReviewAvgScore() {
		return reviewAvgScore;
	}
	public void setReviewAvgScore(int reviewAvgScore) {
		this.reviewAvgScore = reviewAvgScore;
	}
	
}
