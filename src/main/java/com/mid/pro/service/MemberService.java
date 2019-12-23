package com.mid.pro.service;

import java.util.List;

import com.mid.pro.model.MemberVO;
import com.mid.pro.util.Pager;

public interface MemberService {
	
	public int memberJoin(MemberVO memberVO)throws Exception;
		
	public MemberVO memberCheckId(String id)throws Exception;
	
	public MemberVO memberCheckEmail(String email)throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;
	
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	public int memberDelete(MemberVO memberVO)throws Exception;
	
	public List<MemberVO> List(Pager pager) throws Exception;
	
	public MemberVO memberSelect(MemberVO memberVO)throws Exception;
	
	public int memberUpdate2(MemberVO memberVO)throws Exception;
}
