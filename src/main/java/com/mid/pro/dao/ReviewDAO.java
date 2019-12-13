package com.mid.pro.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mid.pro.model.RestaurantVO;
import com.mid.pro.model.ReviewVO;
import com.mid.pro.util.Pager;
import com.mid.pro.util.ReviewPager;

@Repository
public class ReviewDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "reviewMapper.";
	
	//List
	public List<ReviewVO> reviewList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "reviewList", pager);
	}
	//select
	public ReviewVO reviewSelect(ReviewVO reviewVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "reviewSelect", reviewVO);
	}
	//write
	public int reviewWrite(ReviewVO reviewVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "reviewWrite", reviewVO);
	}
	//update
	public int reviewUpdate(ReviewVO reviewVO) throws Exception{
		return sqlSession.update(NAMESPACE + "reviewUpdate", reviewVO);
	}
	//delete
	public int reviewDelete(ReviewVO reviewVO) throws Exception{
		return sqlSession.delete(NAMESPACE + "reviewDelete", reviewVO);
	}
	//count
	public int reviewCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "reviewCount", pager);
	}
	//totalScore
	public int reviewScroe(ReviewVO reviewVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "reviewScore", reviewVO);
	}
}
