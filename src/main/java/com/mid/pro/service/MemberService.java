package com.mid.pro.service;

import com.mid.pro.model.MemberVO;

public interface MemberService {

	public int memberJoin(MemberVO memberVO)throws Exception;
	
	public int memberGrade(MemberVO memberVO)throws Exception;
	
	public int memberCheckId(MemberVO memberVO)throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;
	
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	public int memberDelete(MemberVO memberVO)throws Exception;
	
}
