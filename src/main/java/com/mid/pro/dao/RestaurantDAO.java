package com.mid.pro.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mid.pro.model.FilesVO;
import com.mid.pro.model.RestaurantVO;
import com.mid.pro.util.Pager;

@Repository
public class RestaurantDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "restaurantMapper.";

	//List
	public List<RestaurantVO> restList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE + "restaurantList", pager);
	}

	//select One
	public RestaurantVO restSelect(RestaurantVO restaurantVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "restaurantSelect", restaurantVO);
	}

	//write
	public int restWrite(RestaurantVO restaurantVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "restaurantWrite", restaurantVO);
	}

	//update
	public int restUpdate(RestaurantVO restaurantVO) throws Exception{
		return sqlSession.update(NAMESPACE + "restaurantUpdate", restaurantVO);
	}

	//delete
	public int restDelete(RestaurantVO restaurantVO) throws Exception{
		return sqlSession.delete(NAMESPACE + "restaurantDelete", restaurantVO);
	}

	//count
	public int restCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "restaurantCount", pager);
	}
	//fileList
	public List<FilesVO> fileList(int num) throws Exception{
		return sqlSession.selectList(NAMESPACE + "fileList", num);
	}
	//fileWrite
	public int fileWrite(FilesVO filesVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "fileWrite", filesVO);
	}
	//fileDelete
	public int fileDelete(FilesVO filesVO) throws Exception{
		return sqlSession.delete(NAMESPACE + "fileDelete", filesVO);
	}
	//fileSelect
	public FilesVO fileSelect(FilesVO filesVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "fileSelect", filesVO);
	}
}
