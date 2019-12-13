package com.mid.pro.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mid.pro.model.RestTableVO;

@Repository
public class RestTableDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "tableMapper.";
	
	//list
	public List<RestTableVO> tableList() throws Exception{
		return sqlSession.selectList(NAMESPACE + "tableList");
	}
	//write
	public int tableWrite(RestTableVO restTableVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "tableWrite", restTableVO);
	}
	//update
	public int tableUpdate(RestTableVO restTableVO) throws Exception{
		return sqlSession.update(NAMESPACE + "tableUpdate", restTableVO);
	}
	//delete
	public int tableDelete(RestTableVO restTableVO) throws Exception{
		return sqlSession.delete(NAMESPACE + "tableDelete", restTableVO);
	}
}