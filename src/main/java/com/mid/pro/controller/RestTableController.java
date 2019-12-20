package com.mid.pro.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mid.pro.model.RestTableVO;
import com.mid.pro.model.RestaurantVO;
import com.mid.pro.service.RestTableService;
import com.mid.pro.service.RestaurantService;

@Controller
@RequestMapping("/resttable/**")
public class RestTableController {
	
	@Inject
	private RestTableService restTableService;
	@Inject
	private RestaurantService restaurantService;
	
	//list
	@GetMapping(value = "tableList")
	public ModelAndView tableList(int rest_num) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<RestTableVO> list = restTableService.tableList(rest_num);
		mv.addObject("list", list);
		mv.setViewName("../restaurant/restList");
		
		return mv;
	}
	//write
	@GetMapping(value = "tableWrite")
	public ModelAndView tableWrite(RestaurantVO restaurantVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.restSelect(restaurantVO);
		mv.addObject("vo", restaurantVO);
		mv.setViewName("resttable/tableWrite");
		
		return mv;
	}
	@PostMapping(value = "tableWrite")
	public ModelAndView tableWrite(RestTableVO restTableVO, @RequestParam(value = "quantity") int quantity) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = 0;
		for (int i = 0; i < quantity; i++) {
		result = restTableService.tableWrite(restTableVO);
			System.out.println(result);
		}
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
	@GetMapping(value = "tableUpdate")
	public ModelAndView tableUpdate(RestTableVO restTableVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		restTableVO = restTableService.tableSelect(restTableVO);
		if (restTableVO != null) {
			mv.addObject("vo", restTableVO);
			mv.setViewName("../restaurant/restList");
		} else {
			mv.addObject("msg", "수정할 테이블 정보가 없습니다.");
			mv.addObject("path", "../restaurant/restList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	@PostMapping(value = "tableUpdate")
	public ModelAndView tableUpdate2(RestTableVO restTableVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = restTableService.tableUpdate(restTableVO);
		String msg = "테이블 정보 수정에 실패하였습니다.";
		if (result > 0) {
				mv.setViewName("redirect:../restaurant/restList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "../restaurant/restList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//delete
	@GetMapping(value = "tableDelete")
	public ModelAndView tableDelete(RestTableVO restTableVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = restTableService.tableDelete(restTableVO);
		String msg = "테이블 정보 삭제에 실패하였습니다.";
		if (result > 0) {
			mv.setViewName("redirect:../restaurant/restList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "../restaurant/resetList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
}
