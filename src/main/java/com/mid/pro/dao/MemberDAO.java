package com.mid.pro.dao;

import com.mid.pro.model.MemberVO;

public interface MemberDAO {
	
	//join
	public int memberJoin(MemberVO memberVO)throws Exception;
	
}
