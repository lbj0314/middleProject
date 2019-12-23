package com.mid.pro.dao;

import java.util.List;

import com.mid.pro.model.QnaVO;
import com.mid.pro.util.Pager;

public interface QnaDAO {

	//list
	public List<QnaVO> List(Pager pager)throws Exception;
	
	//select One
	public QnaVO Select(QnaVO qnaVO)throws Exception;
	
	//write
	public int Writer(QnaVO qnaVO)throws Exception;
	
	//update
	public int Update(QnaVO qnaVO)throws Exception;
	
	//delete
	public int Delete(QnaVO qnaVO)throws Exception;
	
	//count
	public int Count(Pager pager)throws Exception;
	
	
	
	
}
