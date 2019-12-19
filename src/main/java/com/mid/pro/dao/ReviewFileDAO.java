//package com.mid.pro.dao;
//
//import java.util.List;
//
//import javax.inject.Inject;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.stereotype.Repository;
//
//import com.mid.pro.model.ReviewFileVO;
//
//@Repository
//public class ReviewFileDAO {
//
//	@Inject
//	private SqlSession sqlSession;
//	private static final String NAMESPACE ="reviewMapper.";
//	
//	
//	
//	public ReviewFileVO fileSelect(ReviewFileVO reviewFileVO)throws Exception{
//		
//		return sqlSession.selectOne(NAMESPACE+"fileSelect", reviewFileVO);
//	};
//	
//	
//	public List<ReviewFileVO> fileList(int num) throws Exception{
//		return sqlSession.selectList(NAMESPACE + "fileList", num);
//	}
//	
//	
//}
