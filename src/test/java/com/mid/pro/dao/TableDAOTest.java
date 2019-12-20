package com.mid.pro.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.mid.pro.TestAbstractCase;
import com.mid.pro.model.RestTableVO;
import com.mid.pro.model.ReviewVO;

public class TableDAOTest extends TestAbstractCase{

	@Inject
	private RestTableDAO restTableDAO;

	@Test
	public void reviewWriteTest() throws Exception {
		RestTableVO restTableVO = new RestTableVO();
		restTableVO.setTable_user(4);
		restTableVO.setOpen_time("1");
		restTableVO.setClose_time("2");
		restTableVO.setRest_num(30);
		restTableVO.setMember_num(1);
		int result = restTableDAO.tableWrite(restTableVO);
		System.out.println(result);
		assertEquals(1, result);
	}

//	@Test
	public void reviewScoreTest(ReviewVO reviewVO) throws Exception{
		for (int i = 0; i < reviewVO.getRest_num(); i++) {
			int totalScore = reviewVO.getScore();
			System.out.println(totalScore);
		}
	}
	
	
}
