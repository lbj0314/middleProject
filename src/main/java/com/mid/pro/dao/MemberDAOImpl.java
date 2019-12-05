package com.mid.pro.dao;

import java.util.HashMap;
import java.util.Map;

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
	public MemberVO memberCheckId(String id)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberCheckId", id);
	}
	
	@Override
	public MemberVO memberCheckEmail(String email)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberCheckEmail", email);
	}
	
	@Override
	public void createAuthKey(String userEmail, String authKey)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userEmail", userEmail);
		map.put("authKey", authKey);
		
		sqlSession.selectOne(NAMESPACE+"createAuthKey", map);
	}
	
	
	  @Override public void userAuth(String userEmail)throws Exception{
	  sqlSession.update(NAMESPACE+"userAuth", userEmail);
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
