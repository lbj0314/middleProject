package com.mid.pro.util;

import javax.inject.Inject;

import com.mid.pro.model.ReviewVO;

public class Score {
	
	@Inject
	private ReviewVO reviewVO;
	
	private Integer score;
	private Integer count;
	
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	public void makeScore(int totalScore) {
		
		
	}
}
