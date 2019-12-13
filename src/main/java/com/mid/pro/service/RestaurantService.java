package com.mid.pro.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mid.pro.dao.RestaurantDAO;
import com.mid.pro.dao.ReviewDAO;
import com.mid.pro.model.MenuFilesVO;
import com.mid.pro.model.RestaurantFilesVO;
import com.mid.pro.model.RestaurantVO;
import com.mid.pro.model.ReviewVO;
import com.mid.pro.util.FileSaver;
import com.mid.pro.util.Pager;

@Service
public class RestaurantService {

	@Inject
	private RestaurantDAO restaurantDAO;
	@Inject
	private ReviewDAO reviewDAO;
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
		restaurantDAO.restUpdateHit(restaurantVO);
		return restaurantDAO.restSelect(restaurantVO);
	}
	//write
	public int restWrite(RestaurantVO restaurantVO, MultipartFile[] file, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload/restaurant");
		RestaurantFilesVO restaurantFilesVO = new RestaurantFilesVO();
		int result = restaurantDAO.restWrite(restaurantVO);

		for (MultipartFile multipartFile:file) {
			if (multipartFile.getSize() != 0) {
				String fileName = fileSaver.save(realPath, multipartFile);
				restaurantFilesVO.setFname(fileName);
				restaurantFilesVO.setRest_num(restaurantVO.getRest_num());
				restaurantFilesVO.setOname(multipartFile.getOriginalFilename());
				result = restaurantDAO.fileWrite(restaurantFilesVO);
				if (result < 1) {
					throw new SQLException();
				}
			}
		}
		return result;
	}
	//update
	public int restUpdate(RestaurantVO restaurantVO, MultipartFile[] file, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload/restaurant");
		RestaurantFilesVO restaurantFilesVO = new RestaurantFilesVO();
		int result = restaurantDAO.restUpdate(restaurantVO);

		for (MultipartFile multipartFile:file) {
			if (multipartFile.getSize() != 0) {
				String fileName = fileSaver.save(realPath, multipartFile);
				restaurantFilesVO.setFname(fileName);
				restaurantFilesVO.setRest_num(restaurantVO.getRest_num());
				restaurantFilesVO.setOname(multipartFile.getOriginalFilename());
				result = restaurantDAO.fileWrite(restaurantFilesVO);
				if (result < 1) {
					throw new SQLException();
				}
			}
		}
		return result;
	}
	//delete
	public int restDelete(RestaurantVO restaurantVO) throws Exception{
		return restaurantDAO.restDelete(restaurantVO);
	}
	//fileSelect
	public RestaurantFilesVO fileSelect(RestaurantFilesVO restaurantFilesVO) throws Exception{
		return restaurantDAO.fileSelect(restaurantFilesVO);
	}
	//fileDelete
	public int fileDelete(RestaurantFilesVO restaurantFilesVO) throws Exception{
		return restaurantDAO.fileDelete(restaurantFilesVO);
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
