package com.mid.pro.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mid.pro.dao.QnaDAO;
import com.mid.pro.dao.QnaDAOImpl;
import com.mid.pro.model.QnaVO;
import com.mid.pro.util.Pager;
import java.util.List;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDAO qnaDAO;
	@Inject
	private QnaDAOImpl qnaDAOImpl;
	
	
	public int boardReply(QnaVO qnaVO) throws Exception{
		qnaDAOImpl.boardReplyUpdate(qnaVO);
		return qnaDAOImpl.boardReply(qnaVO);
	}
		
		
	@Override
	public List<QnaVO>  List(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePager(qnaDAO.Count(pager));
		return qnaDAO.List(pager);		
	}

	@Override
	public QnaVO Select(QnaVO qnaVO) throws Exception {
		qnaVO.getQna_num();
		return qnaDAO.Select(qnaVO);
	}

	@Override
	public int Write(QnaVO qnaVO, HttpSession session) throws Exception {		
		
		int result = qnaDAO.Writer(qnaVO);
		return result;
	}									

	@Override
	public int Update(QnaVO qnaVO, HttpSession session) throws Exception {		

		int result = qnaDAO.Update(qnaVO);		
		return result;
	}

	@Override
	public int Delete(QnaVO qnaVO) throws Exception {
		qnaVO.getQna_num();
		return qnaDAO.Delete(qnaVO);
	}
	

	
}
