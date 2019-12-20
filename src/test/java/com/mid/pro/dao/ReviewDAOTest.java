package com.mid.pro.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.mid.pro.TestAbstractCase;
import com.mid.pro.model.ReviewVO;

public class ReviewDAOTest extends TestAbstractCase{

	@Inject
	private ReviewDAO reviewDAO;

//	@Test
	public void reviewWriteTest() throws Exception {
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setWriter("123");
		reviewVO.setContents("test22222222");
		reviewVO.setMember_num(1);
		System.out.println(reviewVO.getWriter());
		System.out.println(reviewVO.getContents());
		System.out.println(reviewVO.getMember_num());
		
		int result = reviewDAO.reviewWrite(reviewVO);
		System.out.println(result);
		assertEquals(1, result);
	}

	@Test
	public void reviewScoreTest(ReviewVO reviewVO) throws Exception{
		for (int i = 0; i < reviewVO.getRest_num(); i++) {
			int totalScore = reviewVO.getScore();
			System.out.println(totalScore);
		}
	}
	
	
}
