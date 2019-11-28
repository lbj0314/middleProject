package com.mid.pro.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.mid.pro.TestAbstractCase;
import com.mid.pro.model.MemberVO;

public class MemberDAOTest extends TestAbstractCase{

	@Inject
	private MemberDAO memberDAO;
	
	@Test
	public void memberJoinTest()throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("id1");
		memberVO.setPw("pw1");
		memberVO.setName("name1");
		memberVO.setEmail("a@gmail.com");
		memberVO.setTel("0101111111");
		memberVO.setPost1("post1");
		memberVO.setAddr1("addr1");
		memberVO.setAddr2("addr2");
		memberVO.setKind("kind");
		memberVO.setReg_number(111);
		
		int result = memberDAO.memberJoin(memberVO);
		assertEquals(1, result);
	}

}
