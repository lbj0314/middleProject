package com.mid.pro.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mid.pro.model.RestaurantVO;
import com.mid.pro.util.Pager;

@Repository
public class RestaurantDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "restaurantMapper.";
	
	//select One
	public RestaurantVO restSelect(RestaurantVO restaurantVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "restSelect", restaurantVO);
	}
	
	//write
	public int restWrite(RestaurantVO restaurantVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "restWrite", restaurantVO);
	}
	
	//update
	public int restUpdate(RestaurantVO restaurantVO) throws Exception{
		return sqlSession.update(NAMESPACE + "restUpdate", restaurantVO);
	}
	
	//delete
	public int restDelete(RestaurantVO restaurantVO) throws Exception{
		return sqlSession.delete(NAMESPACE + "restDelete", restaurantVO);
	}
	
	//count
	public int restCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "restCount", pager);
	}
}
