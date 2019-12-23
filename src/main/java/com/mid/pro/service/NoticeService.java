package com.mid.pro.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.mid.pro.model.NoticeVO;

import com.mid.pro.util.Pager;

public interface NoticeService {

	//list
	public List<NoticeVO> List(Pager pager) throws Exception;
	
	//select One
	public NoticeVO Select(NoticeVO noticeVO) throws Exception;
	
	//write
	public int Write(NoticeVO noticeVO, MultipartFile[] file, HttpSession session) throws Exception;

	//delete
	public int Delete(NoticeVO noticeVO) throws Exception;

	//update
	public int Update(NoticeVO noticeVO, MultipartFile[] file, HttpSession session) throws Exception;
	

	
}
