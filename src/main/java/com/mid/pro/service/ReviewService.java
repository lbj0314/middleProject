package com.mid.pro.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mid.pro.dao.ReviewDAO;
import com.mid.pro.model.ReviewVO;
import com.mid.pro.util.FileSaver;
import com.mid.pro.util.Pager;

@Service
public class ReviewService {

	@Inject
	private ReviewDAO reviewDAO;
	@Inject
	private FileSaver fileSaver;

	//list
	public List<ReviewVO> reviewList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makePager(reviewDAO.reviewCount(pager));
		return reviewDAO.reviewList(pager);
	}
	//select
	public ReviewVO reviewSelect(ReviewVO reviewVO) throws Exception{
		return reviewDAO.reviewSelect(reviewVO);
	}
	//write
	public int reviewWrite(ReviewVO reviewVO, HttpSession session) throws Exception{
		return reviewDAO.reviewWrite(reviewVO);
	}
	//update
	public int reviewUpdate(ReviewVO reviewVO, HttpSession session) throws Exception{
		return reviewDAO.reviewUpdate(reviewVO);
	}
	//delete
	public int reviewDelete(ReviewVO reviewVO) throws Exception{
		return reviewDAO.reviewDelete(reviewVO);
	}
	//summerFile
	public String summerFile(MultipartFile file, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload/summerfile");
		return fileSaver.save(realPath, file);
	}
	//summerFileDelete
	public Boolean summerFileDelete(String file, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload/summerfile");
		return fileSaver.fileDelete(realPath, file);
	}
}