package com.mid.pro.dao;

import com.mid.pro.model.MemberVO;

public interface MemberDAO {
	
	//join
	public int memberJoin(MemberVO memberVO)throws Exception;
		
	//checkId
	public MemberVO memberCheckId(String id)throws Exception;
	
	//checkEmail
	public int memberCheckEmail(String email)throws Exception;
	
	//createAuthKey
	//public void createAuthKey(String userEmail, String authKey)throws Exception;
	
	//userAuth
	//public void userAuth(String userEmail)throws Exception;
		
	//login 
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;
	
	//update
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	//delete
	public int memberDelete(MemberVO memberVO)throws Exception;
}
