package com.mid.pro.dao;

import java.util.List;

import com.mid.pro.model.NoticeVO;
import com.mid.pro.util.Pager;

public interface NoticeDAO {

	public List<NoticeVO> List(Pager pager)throws Exception;
	
	public NoticeVO Select(NoticeVO noticeVO)throws Exception;
	
	public int Writer(NoticeVO noticeVO)throws Exception;
	
	public int Update(NoticeVO noticeVO)throws Exception;
	
	public int Delete(NoticeVO noticeVO)throws Exception;
	
	public int Count (Pager pager)throws Exception;
	
}
