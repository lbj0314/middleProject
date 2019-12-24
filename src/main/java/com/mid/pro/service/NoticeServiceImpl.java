package com.mid.pro.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mid.pro.dao.NoticeDAO;
import com.mid.pro.model.NoticeVO;
import com.mid.pro.util.FileSaver;
import com.mid.pro.util.Pager;


@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeVO noticeVO;
	
	@Inject
	private FileSaver fs;
	
	@Inject
	private NoticeDAO noticeDAO;

	
	@Override
	public java.util.List<NoticeVO> List(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePager(noticeDAO.Count(pager));
		return noticeDAO.List(pager);
	}

	@Override
	public NoticeVO Select(NoticeVO noticeVO) throws Exception {
		noticeVO.getNotice_num();
		return noticeDAO.Select(noticeVO);
		}

	@Override
	public int Write(NoticeVO noticeVO, MultipartFile[] file, HttpSession session) throws Exception {
		
		return noticeDAO.Writer(noticeVO);
	}

	@Override
	public int Update(NoticeVO noticeVO, MultipartFile[] file, HttpSession session) throws Exception {
		
		return noticeDAO.Update(noticeVO);
	}

	@Override
	public int Delete(NoticeVO noticeVO) throws Exception {
		noticeVO.getNotice_num();
		return noticeDAO.Delete(noticeVO);
	}

}
