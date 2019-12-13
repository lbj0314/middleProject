package com.mid.pro.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mid.pro.model.RestTableVO;
import com.mid.pro.service.RestTableService;

@Controller
@RequestMapping("/resttable/**")
public class RestTableController {
	
	@Inject
	private RestTableService restTableService;
	
	//list
	@GetMapping(value = "tableList")
	public ModelAndView tableList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<RestTableVO> list = restTableService.tableList();
		mv.addObject("list", list);
		mv.setViewName("../restaurant/restList");
		
		return mv;
	}
	//write
	@GetMapping(value = "tableWrite")
	public ModelAndView tableWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resttable/tableWrite");
		
		return mv;
	}
	@PostMapping(value = "tableWrite")
	public ModelAndView tableWrite(RestTableVO restTableVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = restTableService.tableWrite(restTableVO);
		String msg = "식당테이블 생성에 실패하였습니다.";
		if (result > 0) {
			mv.setViewName("redirect:../restaurant/restList");
		} else {
		mv.addObject("msg", msg);
		mv.addObject("path", "../restaurant/restList");
		mv.setViewName("common/common_result");
		}
		return mv;
	}
	//update
	
	//delete
}
