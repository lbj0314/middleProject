package com.mid.pro.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mid.pro.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sqlSession;
	private final static String NAMESPACE = "memberMapper.";
	
	@Override
	public int memberJoin(MemberVO memberVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"memberJoin", memberVO);
		
	}
	
	@Override
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberVO);		
	}
	
	@Override
	public int memberUpdate(MemberVO memberVO)throws Exception{
		return sqlSession.update(NAMESPACE+"memberUpdate", memberVO);
	}
	
	@Override
	public int memberDelete(MemberVO memberVO)throws Exception{
		return sqlSession.update(NAMESPACE+"memberDelete", memberVO);
	}
}
