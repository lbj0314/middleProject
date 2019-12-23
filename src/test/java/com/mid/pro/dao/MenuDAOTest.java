package com.mid.pro.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.web.multipart.MultipartFile;

import com.mid.pro.TestAbstractCase;
import com.mid.pro.model.MenuFilesVO;
import com.mid.pro.model.MenuListVO;
import com.mid.pro.model.MenuVO;
import com.mid.pro.service.MenuService;

public class MenuDAOTest extends TestAbstractCase{

	@Inject
	private MenuDAO menuDAO;

	//@Test
	public void menuWriteTest() throws Exception {
		MenuVO menuVO = new MenuVO();
		menuVO.setMenu_name("吏щ퐬");
		menuVO.setMenu_contents("�뼹�겙�븯怨� 移쇱뭡�븳 留�");
		menuVO.setPrice(7000);
		menuVO.setOrigin("�뼇�뙆 以묎뎅�궛");
		menuVO.setMenu_num(3);
		int result = menuDAO.menuUpdate(menuVO);

		assertEquals(1, result);
	}

	
	//@Test
	public void menuWirteListTest(MenuListVO menuListVO)throws Exception{
		int[] menu_num = new int[2];
		String [] menu_name = new String[2];
		String [] menu_contents = new String[2];
		int[] price = new int[2];
		String[] origin = new String[2];
			
		for(int i=0; i<menu_num.length; i++) {
			menu_num[i] = 20;
			menu_name[i] = "i";
			menu_contents[i] = "i";
			price[i] = i;
			origin[i] = "i";

				}

	}
	
	//@Test
	public void fileWriteTest() throws Exception{
		MenuFilesVO filesVO = new MenuFilesVO();
		filesVO.setMenu_num(3);
		filesVO.setFname("103131.jpg");
		filesVO.setOname("jajang.jpg");
	}
	
	
}
