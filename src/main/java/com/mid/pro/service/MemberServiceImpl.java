package com.mid.pro.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mid.pro.dao.MemberDAOImpl;
import com.mid.pro.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAOImpl memberDAOImpl;

	@Override
	public int memberJoin(MemberVO memberVO) throws Exception {		
		return memberDAOImpl.memberJoin(memberVO);
	}
	
	@Override
	public int memberGrade(MemberVO memberVO) throws Exception {
		return memberDAOImpl.memberGrade(memberVO);
	}
	
	@Override
	public int memberCheckId(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberCheckId(memberVO);
	}

	@Override
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberLogin(memberVO);	
	}
	
	@Override
	public int memberUpdate(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberUpdate(memberVO);
	}
	
	@Override
	public int memberDelete(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberDelete(memberVO);
	}
}
