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
	
	//테이블 개수
	public List<RestTableVO> tableList(int rest_num) throws Exception{
		return sqlSession.selectList(NAMESPACE + "tableList", rest_num);
	}
	//테이블 1개 선택
	public RestTableVO tableSelect(RestTableVO restTableVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "tableSelect", restTableVO);
	}
	//테이블 개수 입력
	public int tableWrite(RestTableVO restTableVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "tableWrite", restTableVO);
	}
	//테이블 개수 수정
	public int tableUpdate(RestTableVO restTableVO) throws Exception{
		return sqlSession.update(NAMESPACE + "tableUpdate", restTableVO);
	}
	//테이블 삭제
	public int tableDelete(RestTableVO restTableVO) throws Exception{
		return sqlSession.delete(NAMESPACE + "tableDelete", restTableVO);
	}
}