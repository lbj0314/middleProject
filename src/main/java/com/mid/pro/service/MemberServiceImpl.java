package com.mid.pro.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mid.pro.dao.MemberDAO;
import com.mid.pro.dao.MemberDAOImpl;
import com.mid.pro.model.MemberVO;
import com.mid.pro.util.FileSaver;
import com.mid.pro.util.Pager;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAOImpl memberDAOImpl;
	@Inject
	private FileSaver fs;
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public int memberJoin(MemberVO memberVO) throws Exception {		
		return memberDAOImpl.memberJoin(memberVO);
	}
	
	@Override
	public MemberVO memberCheckId(String id)throws Exception{
		return memberDAOImpl.memberCheckId(id);
	}
	
	@Override
	public MemberVO memberCheckEmail(String email)throws Exception{
		return memberDAOImpl.memberCheckEmail(email);
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
	
	@Override
	public java.util.List<MemberVO> List(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePager(memberDAOImpl.Count(pager));
		return memberDAOImpl.List(pager);
	}
	@Override
	public MemberVO memberSelect(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberSelect(memberVO);
	}
	
	@Override
	public int memberUpdate2(MemberVO memberVO)throws Exception{
		return memberDAOImpl.memberUpdate2(memberVO);
	}
}
