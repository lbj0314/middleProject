package com.mid.pro.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mid.pro.model.MemberVO;
import com.mid.pro.model.MenuFilesVO;
import com.mid.pro.model.ReservationVO;
import com.mid.pro.model.RestaurantFilesVO;
import com.mid.pro.model.RestaurantVO;
import com.mid.pro.model.ReviewVO;
import com.mid.pro.service.MemberService;
import com.mid.pro.service.MemberServiceImpl;
import com.mid.pro.service.ReservationService;
import com.mid.pro.service.RestaurantService;
import com.mid.pro.service.ReviewService;
import com.mid.pro.util.Pager;

@Controller
@RequestMapping("/restaurant/**")
public class RestaurantController {

	@Inject
	private RestaurantService restaurantService;
	@Inject
	private ReviewService reviewService;
	@Inject
	private ReservationService reservationService;
	
	//list
	@GetMapping(value = "restList")
	public ModelAndView restList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<RestaurantVO> list = restaurantService.restList(pager);
		mv.addObject("pager", pager);
		mv.addObject("list", list);
		mv.setViewName("restaurant/restList");

		return mv;
	}
	//select One
	@GetMapping(value = "restSelect")
	public ModelAndView restSelect(RestaurantVO restaurantVO, ReviewVO reviewVO, ReservationVO reservationVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.restSelect(restaurantVO);
		reservationVO = reservationService.reservationSelect(reservationVO);
		if (restaurantVO != null) {
			mv.addObject("vo", restaurantVO);
			mv.addObject("review", reviewVO);
			mv.addObject("rev", reservationVO);
			restaurantVO.getRest_contents().replace("\r\n", "<br>");
			mv.setViewName("restaurant/restSelect");
		} else {
			mv.addObject("msg", "내용이 없습니다.");
			mv.addObject("path", "./restList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//write
	@GetMapping(value = "restWrite")
	public ModelAndView restWrite() throws Exception{
		ModelAndView mv = new ModelAndView();

		mv.setViewName("restaurant/restWrite");

		return mv;
	}
	@PostMapping(value = "restWrite")
	public ModelAndView restWrite(RestaurantVO restaurantVO, MultipartFile[] file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = restaurantService.restWrite(restaurantVO, file,session);
		String msg = "식당 소개글 작성에 실패하였습니다.";
		//		System.out.println(file);
		if (result > 0) {
			mv.setViewName("redirect:./restList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./restList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//update
	@GetMapping(value = "restUpdate")
	public ModelAndView restUpdate(RestaurantVO restaurantVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.restSelect(restaurantVO);
		if (restaurantVO != null) {
			mv.addObject("vo", restaurantVO);
			mv.setViewName("restaurant/restUpdate");
		} else {
			mv.addObject("msg", "수정할 식당 소개글이 없습니다.");
			mv.addObject("path", "./restList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	@PostMapping(value = "restUpdate")
	public ModelAndView restUpdate(RestaurantVO restaurantVO, MultipartFile[] file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = restaurantService.restUpdate(restaurantVO, file, session);
		String msg = "식당 소개글 수정에 실패하였습니다.";
		if (result > 0) {
			mv.setViewName("redirect:./restList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./restList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//delete
	@GetMapping(value = "restDelete")
	public ModelAndView restDelete(RestaurantVO restaurantVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = restaurantService.restDelete(restaurantVO);
		String msg = "식당 소개글 삭제에 실패하였습니다.";
		if (result > 0) {
			mv.setViewName("redirect:./restList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./restList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//fileDelete
	@PostMapping(value = "fileDelete")
	public ModelAndView fileDelete(RestaurantFilesVO restaurantFilesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = restaurantService.fileDelete(restaurantFilesVO);
		String msg = "Delete Fail";
		if (result > 0) {
			mv.addObject("result", result);
			mv.setViewName("common/common_ajaxResult");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./restList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//fileDown
	@GetMapping(value ="fileDown")
	public ModelAndView fileDown(RestaurantFilesVO restaurantFilesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		restaurantFilesVO = restaurantService.fileSelect(restaurantFilesVO);

		mv.addObject("file", restaurantFilesVO);

		mv.setViewName("fileDown");

		return mv;
	}
	
	//	//summerFile
	//	@PostMapping(value = "summerFile")
	//	public ModelAndView summerFile(MultipartFile file, HttpSession session) throws Exception{
	//		ModelAndView mv = new ModelAndView();
	//		String fileName = restaurantService.summerFile(file, session);
	//		
	//		mv.addObject("result", fileName);
	//		mv.setViewName("common/common_ajaxResult");
	//		
	//		return mv;	
	//	}
	//	//summerFileDelete
	//	@PostMapping(value = "summerFileDelete")
	//	public ModelAndView summerDelete(String file, HttpSession session) throws Exception {
	//		ModelAndView mv = new ModelAndView();
	//		Boolean check = restaurantService.summerFileDelete(file, session);
	//		String msg = "이미지 삭제 실패하였습니다.";
	//		if (check) {
	//			msg = "이미지 삭제 성공하였습니다.";
	//		}
	//		mv.addObject("result", msg);
	//		mv.setViewName("common/common_ajaxResult");
	//		
	//		return mv;
	//	}
}
