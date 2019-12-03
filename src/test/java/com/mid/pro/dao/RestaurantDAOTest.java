package com.mid.pro.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.mid.pro.TestAbstractCase;
import com.mid.pro.model.FilesVO;
import com.mid.pro.model.RestaurantVO;

public class RestaurantDAOTest extends TestAbstractCase{

	@Inject
	private RestaurantDAO restaurantDAO;

	//@Test
	public void restaurantWriteTest() throws Exception {
		RestaurantVO restaurantVO = new RestaurantVO();
		restaurantVO.setRest_name("test");
		restaurantVO.setRest_contents("test");
		restaurantVO.setRest_post1(10000);
		restaurantVO.setRest_addr1("test");
		restaurantVO.setRest_addr2("test");
		restaurantVO.setRest_tel("02-2222-2222");
		restaurantVO.setRest_url("");
		restaurantVO.setRest_Kind("test");
		restaurantVO.setMember_num(1);
		int result = restaurantDAO.restWrite(restaurantVO);

		assertEquals(1, result);
	}

	//@Test
	public void menuUpdateTest() throws Exception {
		

		
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
