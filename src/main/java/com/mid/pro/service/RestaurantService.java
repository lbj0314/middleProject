package com.mid.pro.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mid.pro.dao.RestaurantDAO;
import com.mid.pro.model.RestaurantVO;
import com.mid.pro.util.FileSaver;
import com.mid.pro.util.Pager;

@Service
public class RestaurantService {
	
	@Inject
	private RestaurantDAO restaurantDAO;
	@Inject
	private FileSaver fileSaver;
	
	//list
	public List<RestaurantVO> restList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makePager(restaurantDAO.restCount(pager));
		return restaurantDAO.restList(pager);
	}
	//selectOne
	public RestaurantVO restSelect(RestaurantVO restaurantVO) throws Exception{
		return restaurantDAO.restSelect(restaurantVO);
	}
	//write
	public int restWrite(RestaurantVO restaurantVO, HttpSession session) throws Exception{
		int result = restaurantDAO.restWrite(restaurantVO, session);
		return result;
	}
	//update
	public int restUpdate(RestaurantVO restaurantVO, HttpSession session) throws Exception{
		int result = restaurantDAO.restUpdate(restaurantVO, session);
		return result;
	}
	//delete
	public int restDelete(RestaurantVO restaurantVO) throws Exception{
		return restaurantDAO.restDelete(restaurantVO);
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
