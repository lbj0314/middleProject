package com.mid.pro.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.mid.pro.dao.ReviewDAO;
import com.mid.pro.model.ReviewVO;
import com.mid.pro.util.Pager;

@Service
public class ReviewService {

	@Inject
	private ReviewDAO reviewDAO;

	//list
	public List<ReviewVO> reviewList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makePager(reviewDAO.reviewCount(pager));
		System.out.println(pager.getStartRow());
		System.out.println(pager.getLastRow());
		return reviewDAO.reviewList(pager);
	}
	//select
	public ReviewVO reviewSelect(ReviewVO reviewVO) throws Exception{
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
	//reviewAvgScore
	public ReviewVO reviewAvgScore(ReviewVO reviewVO) throws Exception{
		return reviewDAO.reviewAvgScore(reviewVO);
	}
	//reviewMain
	public List<ReviewVO> reviewMain(ReviewVO reviewVO)throws Exception{
			return reviewDAO.reviewMain(reviewVO);
	}

}