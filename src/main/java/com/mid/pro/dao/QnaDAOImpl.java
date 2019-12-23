package com.mid.pro.dao;

import javax.inject.Inject;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mid.pro.model.QnaVO;
import com.mid.pro.util.Pager;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSession sqlSession;
	private final static String NAMESPACE ="qnaMapper.";
	
	//list
	@Override
	public List<QnaVO> List(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "qnaList", pager);
	}
	
	//select
	@Override
	public QnaVO Select(QnaVO qnaVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "qnaSelect", qnaVO);
	}
	
	//writer
	@Override
	public int Writer(QnaVO qnaVO) throws Exception {
		return sqlSession.insert(NAMESPACE + "qnaWrite", qnaVO);
	}
	
	//update
	@Override
	public int Update(QnaVO qnaVO) throws Exception {
		return sqlSession.update(NAMESPACE + "qnaUpdate", qnaVO);
	}
	
	//delete
	@Override
	public int Delete(QnaVO qnaVO) throws Exception {
		return sqlSession.delete(NAMESPACE + "qnaDelete", qnaVO);
	}
	
	//count
	@Override
	public int Count(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "qnaCount", pager);
	}
	
	//Reply
	public int boardReplyUpdate(QnaVO qnaVO) throws Exception{
		return sqlSession.update(NAMESPACE+"boardReplyUpdate", qnaVO);
	}
	
	//Reply
	public int boardReply(QnaVO qnaVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"boardReply", qnaVO);
	}

}
