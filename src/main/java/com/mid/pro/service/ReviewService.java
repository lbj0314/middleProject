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

	//list
	public List<ReviewVO> reviewList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makePager(reviewDAO.reviewCount(pager));
		return reviewDAO.reviewList(pager);
	}
	//select
	public ReviewVO reviewSelect(ReviewVO reviewVO) throws Exception{
		reviewDAO.reviewScroe(reviewVO);
		return reviewDAO.reviewSelect(reviewVO);
	}
	//write
	public int reviewWrite(ReviewVO reviewVO) throws Exception{
		return reviewDAO.reviewWrite(reviewVO);
	}
	//update
	public int reviewUpdate(ReviewVO reviewVO) throws Exception{
		return reviewDAO.reviewUpdate(reviewVO);
	}
	//delete
	public int reviewDelete(ReviewVO reviewVO) throws Exception{
		return reviewDAO.reviewDelete(reviewVO);
	}

}
