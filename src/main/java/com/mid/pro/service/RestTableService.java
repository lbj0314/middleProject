package com.mid.pro.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mid.pro.dao.RestTableDAO;
import com.mid.pro.model.RestTableVO;

@Service
public class RestTableService {
	
	@Inject
	private RestTableDAO restTableDAO;
	
	//list
	public List<RestTableVO> tableList(int rest_num) throws Exception{
		return restTableDAO.tableList(rest_num);
	}
	//select
	public RestTableVO tableSelect(RestTableVO restTableVO) throws Exception{
		return restTableDAO.tableSelect(restTableVO);
	}
	//write
	public int tableWrite(RestTableVO restTableVO) throws Exception{
		return restTableDAO.tableWrite(restTableVO);
	}
	//update
	public int tableUpdate(RestTableVO restTableVO) throws Exception{
		return restTableDAO.tableUpdate(restTableVO);
	}
	//delete
	public int tableDelete(RestTableVO restTableVO) throws Exception{
		return restTableDAO.tableDelete(restTableVO);
	}
}
