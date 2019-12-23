package com.mid.pro.dao;

import java.util.List;

import com.mid.pro.model.MemberVO;
import com.mid.pro.util.Pager;

public interface MemberDAO {
	
	//join
	public int memberJoin(MemberVO memberVO)throws Exception;
		
	//checkId
	public MemberVO memberCheckId(String id)throws Exception;
	
	//checkEmail
	public MemberVO memberCheckEmail(String email)throws Exception;
	
	//createAuthKey
	public void createAuthKey(String email, String authKey)throws Exception;
	
	//userAuth
	public void userAuth(String email)throws Exception;
		
	//login 
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;
	
	//update
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	//delete
	public int memberDelete(MemberVO memberVO)throws Exception;
	
	
	public List<MemberVO> List(Pager pager)throws Exception;
	
	
	public int Count (Pager pager)throws Exception;
	
	//select
	public MemberVO memberSelect(MemberVO memberVO)throws Exception;
	
	//update
	public int memberUpdate2(MemberVO memberVO)throws Exception;
	

}
