package com.mid.pro.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mid.pro.model.NoticeVO;

import com.mid.pro.util.Pager;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession sqlSession;
	private final static String NAMESPACE ="noticeMapper.";
	
	
	//list
	@Override
	public List<NoticeVO> List(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "noticeList", pager);
	}
	
	//select
	@Override
	public NoticeVO Select(NoticeVO noticeVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "noticeSelect", noticeVO);
	}
	
	//writer
	@Override
	public int Writer(NoticeVO noticeVO) throws Exception {
		return sqlSession.insert(NAMESPACE + "noticeWrite", noticeVO);
	}
	
	//update
	@Override
	public int Update(NoticeVO noticeVO) throws Exception {
		return sqlSession.update(NAMESPACE + "noticeUpdate", noticeVO);
	}
	
	//delete
	@Override
	public int Delete(NoticeVO noticeVO) throws Exception {
		return sqlSession.delete(NAMESPACE + "noticeDelete", noticeVO);
	}
	
	//count
	@Override
	public int Count(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "noticeCount", pager);
	}
	
	//Reply
	public int boardReplyUpdate(NoticeVO noticeVO) throws Exception{
		return sqlSession.update(NAMESPACE+"boardReplyUpdate", noticeVO);
	}
	
	public int boardReply(NoticeVO noticeVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"boardReply", noticeVO);
	}

	

	
}
