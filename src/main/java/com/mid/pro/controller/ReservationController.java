package com.mid.pro.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mid.pro.model.RestTableVO;
import com.mid.pro.model.RestaurantVO;
import com.mid.pro.service.RestTableService;
import com.mid.pro.service.RestaurantService;

@Controller
@RequestMapping("/reservation/**")
public class ReservationController {
	
	@Inject
	private RestaurantService restaurantService;
	@Inject
	private RestTableService restTableService;
	
	//list
	@GetMapping("reservation")
	public ModelAndView fcal(RestaurantVO restaurantVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.restSelect(restaurantVO);
		mv.addObject("vo", restaurantVO);
		
		return mv;
	}
	
	//calendar
	public ModelAndView cal(RestaurantVO restaurantVO, int rest_num, HttpSession session, @RequestParam("frev_date") String rev_date) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<RestTableVO> table = restTableService.tableList(rest_num);
		List<RestTableVO> table2 = restTableService.tableList(rest_num);
		
		return mv;
	}
	
}
