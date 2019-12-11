package com.mid.pro.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.mid.pro.TestAbstractCase;
import com.mid.pro.model.MenuFilesVO;
import com.mid.pro.model.MenuVO;

public class MenuDAOTest extends TestAbstractCase{

	@Inject
	private MenuDAO menuDAO;

	//@Test
	public void menuWriteTest() throws Exception {
		MenuVO menuVO = new MenuVO();
		menuVO.setMenu_name("짬뽕");
		menuVO.setMenu_contents("얼큰하고 칼칼한 맛");
		menuVO.setPrice(7000);
		menuVO.setOrigin("양파 중국산");
		menuVO.setMenu_num(3);
		int result = menuDAO.menuUpdate(menuVO);

		assertEquals(1, result);
	}

//	@Test
//	public void menuUpdateTest() throws Exception {
//		MenuVO menuVO = new MenuVO();
//		menuVO.setName("짬뽕");
//		menuVO.setContents("얼큰하고 칼칼한 맛");
//		menuVO.setPrice(7000);
//		menuVO.setOrigin("양파 중국산");
//		menuVO.setMenu_num(3);
//		int result = menuDAO.menuUpdate(menuVO);
//
//		assertEquals(1, result);
//	}
	
	@Test
	public void fileWriteTest() throws Exception{
		MenuFilesVO filesVO = new MenuFilesVO();
		filesVO.setMenu_num(3);
		filesVO.setFname("103131.jpg");
		filesVO.setOname("jajang.jpg");
	}
	
	
}
