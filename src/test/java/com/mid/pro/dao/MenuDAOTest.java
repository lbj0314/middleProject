package com.mid.pro.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.mid.pro.TestAbstractCase;
import com.mid.pro.model.FilesVO;
import com.mid.pro.model.MemberVO;
import com.mid.pro.model.MenuVO;
import com.mid.pro.model.RestaurantVO;

public class MenuDAOTest extends TestAbstractCase{

	@Inject
	private MenuDAO menuDAO;

	//@Test
	public void menuWriteTest() throws Exception {
		MenuVO menuVO = new MenuVO();
		RestaurantVO restaurantVO = new RestaurantVO();
		menuVO.setName("짬뽕");
		menuVO.setContents("얼큰하고 칼칼한 맛");
		menuVO.setPrice(6000);
		menuVO.setOrigin("양파 중국산");
		menuVO.setRest_num(1);
		int result = menuDAO.menuWrite(menuVO);

		assertEquals(1, result);
	}

	@Test
	public void menuUpdateTest() throws Exception {
		MenuVO menuVO = new MenuVO();
		menuVO.setName("짬뽕");
		menuVO.setContents("얼큰하고 칼칼한 맛");
		menuVO.setPrice(7000);
		menuVO.setOrigin("양파 중국산");
		menuVO.setMenu_num(3);
		int result = menuDAO.menuUpdate(menuVO);

		assertEquals(1, result);
	}
	
//	@Test
	public void fileWriteTest() throws Exception{
		FilesVO filesVO = new FilesVO();
		filesVO.setMenu_num(1);
		filesVO.setRest_num(1);
		filesVO.setFname("103131.jpg");
		filesVO.setOname("jajang.jpg");
	}
	
	
}
