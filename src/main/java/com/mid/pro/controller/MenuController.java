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

import com.mid.pro.model.MenuFilesVO;
import com.mid.pro.model.MenuListVO;
import com.mid.pro.model.MenuVO;
import com.mid.pro.model.RestaurantVO;
import com.mid.pro.service.MenuService;
import com.mid.pro.service.RestaurantService;


@Controller
@RequestMapping("/menu/**")
public class MenuController {
	
	@Inject
	private MenuService menuService;
	@Inject
	private RestaurantService restaurantService;
	
	//list
	@GetMapping(value = "menuList")
	public ModelAndView menuList(MenuVO menuVO, RestaurantVO restaurantVO) throws Exception{
	
		ModelAndView mv = new ModelAndView();
		List<MenuVO> list = menuService.menuList(menuVO);
		restaurantVO = restaurantService.restSelect(restaurantVO);
		
		mv.addObject("rest", restaurantVO);
		mv.addObject("list", list);
		mv.setViewName("menu/menuList");

		System.out.println(list.get(0).getFiles());
		
		return mv;
	}
	
	//select One
	@GetMapping(value = "menuSelect")
	public ModelAndView menuSelect(MenuVO menuVO, RestaurantVO restaurantVO) throws Exception{
		ModelAndView mv = new ModelAndView();
			menuVO = menuService.menuSelect(menuVO);
			//menuVO.setMenu_contents(menuVO.getMenu_contents().replace("\r\n", "<br>"));
			
		if (menuVO != null) {
			mv.addObject("vo", menuVO);	
			mv.addObject("rest", restaurantVO);
			//menuVO.getMenu_contents().replace("\r\n", "<br>");
			mv.setViewName("menu/menuSelect");
		} else {
			mv.addObject("msg", "�궡�슜�씠 �뾾�뒿�땲�떎.");
			mv.addObject("path", "./menuList");
			mv.setViewName("common/common_result");
		} 
		
		return mv;
	}
	
	
	//write
	@GetMapping(value = "menuWrite")
	public ModelAndView menuWrite(RestaurantVO restaurantVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.restSelect(restaurantVO);
		mv.addObject("vo", restaurantVO);
		mv.setViewName("menu/menuWrite");
		
		return mv;
	}
	
	
	@PostMapping(value = "menuWrite")
	public ModelAndView menuWrite(MenuListVO menuListVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
			
		  int result = menuService.menuWrite(menuListVO,session); 
		  String msg
		  = "硫붾돱 �옉�꽦�뿉 �떎�뙣�븯���뒿�땲�떎.";
		 
		  if (result > 0) { mv.setViewName("redirect:./menuList"); 
		  } else {
		  mv.addObject("msg", msg); mv.addObject("path", "./menuList");
		  mv.setViewName("common/common_result"); 
		  }
		 
		return mv;
	}
	//update
	@GetMapping(value = "menuUpdate")
	public ModelAndView menuUpdate(MenuVO menuVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		menuVO = menuService.menuSelect(menuVO);
		if (menuVO != null) {
			mv.addObject("vo", menuVO);
			mv.setViewName("menu/menuUpdate");
		} else {
			mv.addObject("msg", "�닔�젙�븷 硫붾돱媛� �뾾�뒿�땲�떎.");
			mv.addObject("path", "./menuList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	
	
	
	@PostMapping(value = "menuUpdate")
	public ModelAndView menuUpdate(MenuVO menuVO, MultipartFile file ,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();	

		int result = menuService.menuUpdate(menuVO, file, session);
	
		String msg = "硫붾돱 �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎.";
		if (result > 0) {
			mv.setViewName("redirect:./menuList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./menuList");
			mv.setViewName("common/common_result");
		}
		
		return mv;
	}
	//delete
	@GetMapping(value = "menuDelete")
	public ModelAndView menuDelete(MenuVO menuVO) throws Exception{
	ModelAndView mv = new ModelAndView();
	int result = menuService.menuDelete(menuVO);
	String msg = "硫붾돱 �궘�젣�뿉 �떎�뙣�븯���뒿�땲�떎.";
	if (result > 0) {
		mv.addObject("msg", "�궘�젣�릺�뿀�뒿�땲�떎.");
	} else {
		
		mv.addObject("msg", msg);
	}
	
	mv.addObject("path", "./menuList");
	mv.setViewName("common/common_result");
	
	return mv;
	}
	//fileDelete
	@PostMapping(value = "fileDelete")
	public ModelAndView fileDelete(MenuFilesVO menufilesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = menuService.fileDelete(menufilesVO);
		String msg = "Delete Fail";
		if (result > 0) {
			mv.addObject("result", result);
			mv.setViewName("common/common_ajaxResult");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./menuList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//fileDown
	@GetMapping(value ="fileDown")
	public ModelAndView fileDown(MenuFilesVO menufilesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		menufilesVO = menuService.fileSelect(menufilesVO);

		mv.addObject("file", menufilesVO);
		
		mv.setViewName("fileDown");

		return mv;
	}
	//summerFile
	@PostMapping(value = "summerFile")
	public ModelAndView summerFile(MultipartFile file, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String fileName = menuService.summerFile(file, session);

		mv.addObject("result", fileName);
		mv.setViewName("common/common_ajaxResult");

		return mv;
	}
	//summerFileDelete
	@PostMapping(value = "summerFileDelete")
	public ModelAndView summerDelete(String file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean check = menuService.summerFileDelete(file, session);
		String result = "Delete Fail";
		if(check) {
			result = "Delete Success";
		}
		mv.addObject("result", result);
		mv.setViewName("common/common_ajaxResult");
		return mv;
	}
}
