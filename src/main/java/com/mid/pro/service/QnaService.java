package com.mid.pro.service;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;

import com.mid.pro.model.QnaVO;
import com.mid.pro.util.Pager;

public interface QnaService {

	//list
	public List<QnaVO> List(Pager pager) throws Exception;
	
	//select One
	public QnaVO Select(QnaVO qnaVO) throws Exception;
	
	//write
	public int Write(QnaVO qnaVO,  HttpSession session) throws Exception;
	
	//update
	public int Update(QnaVO qnaVO,  HttpSession session) throws Exception;
	
	//delete
	public int Delete(QnaVO qnaVO) throws Exception;

	

}
