package com.mid.pro.model;

import java.sql.Date;
import java.util.List;

public class RestaurantVO {

	private int rest_num;
	private String rest_name;
	private String rest_contents;
	private int rest_post1;
	private String rest_addr1;
	private String rest_addr2;
	private String rest_tel;
	private String rest_url;
	private String kind;
	private Date reg_date;
	private int hit;
	private int review_hit;
	private Date rev_date;
	private int member_num;
	private List<FilesVO> files;
	
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
	public String getRest_contents() {
		return rest_contents;
	}
	public void setRest_contents(String rest_contents) {
		this.rest_contents = rest_contents;
	}
	public int getRest_post1() {
		return rest_post1;
	}
	public void setRest_post1(int rest_post1) {
		this.rest_post1 = rest_post1;
	}
	public String getRest_addr1() {
		return rest_addr1;
	}
	public void setRest_addr1(String rest_addr1) {
		this.rest_addr1 = rest_addr1;
	}
	public String getRest_addr2() {
		return rest_addr2;
	}
	public void setRest_addr2(String rest_addr2) {
		this.rest_addr2 = rest_addr2;
	}
	public String getRest_tel() {
		return rest_tel;
	}
	public void setRest_tel(String rest_tel) {
		this.rest_tel = rest_tel;
	}
	public String getRest_url() {
		return rest_url;
	}
	public void setRest_url(String rest_url) {
		this.rest_url = rest_url;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getReview_hit() {
		return review_hit;
	}
	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}
	public Date getRev_date() {
		return rev_date;
	}
	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public List<FilesVO> getFiles() {
		return files;
	}
	public void setFiles(List<FilesVO> files) {
		this.files = files;
	}

}