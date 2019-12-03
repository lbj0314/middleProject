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

import com.mid.pro.model.FilesVO;
import com.mid.pro.model.MenuVO;
import com.mid.pro.service.MenuService;


@Controller
@RequestMapping("/menu/**")
public class MenuController {
	
	@Inject
	private MenuService menuService;
	
	//list
	@GetMapping(value = "menuList")
	public ModelAndView menuList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MenuVO> list = menuService.menuList();
		mv.addObject("list", list);
		mv.setViewName("menu/menuList");

		return mv;
	}
	
	//select One
	@GetMapping(value = "menuSelect")
	public ModelAndView menuSelect(MenuVO menuVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		menuVO = menuService.menuSelect(menuVO);
		if (menuVO != null) {
			mv.addObject("vo", menuVO);
			menuVO.setContents(menuVO.getContents().replace("\r\n", "<br>"));
			mv.setViewName("menu/menuSelect");
		} else {
			mv.addObject("msg", "내용이 없습니다.");
			mv.addObject("path", "./menuList");
			mv.setViewName("common/common_result");
		}
		
		return mv;
	}
	//write
	@GetMapping(value = "menuWrite")
	public ModelAndView menuWrite(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("menu/menuWrite");
		
		return mv;
	}
	@PostMapping(value = "menuWrite")
	public ModelAndView menuWrite(MenuVO menuVO, MultipartFile[] file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = menuService.menuWrite(menuVO, file, session);
		String msg = "메뉴 작성에 실패하였습니다.";
		
		if (result > 0) {
			mv.setViewName("redirect:./menuList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./menuList");
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
			mv.addObject("msg", "수정할 메뉴가 없습니다.");
			mv.addObject("path", "./menuList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	@PostMapping(value = "menuUpdate")
	public ModelAndView menuUpdate(MenuVO menuVO, MultipartFile[] file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = menuService.menuUpdate(menuVO, file, session);
		String msg = "메뉴 수정에 실패하였습니다.";
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
	String msg = "메뉴 삭제에 실패하였습니다.";
	if (result > 0) {
		mv.setViewName("redirect:./menuList");
	} else {
		mv.addObject("msg", msg);
		mv.addObject("path", "./menuList");
		mv.setViewName("common/common_result");
	}
	return mv;
	}
	//fileDelete
	@PostMapping(value = "fileDelete")
	public ModelAndView fileDelete(FilesVO filesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = menuService.fileDelete(filesVO);
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
	public ModelAndView fileDown(FilesVO filesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		filesVO = menuService.fileSelect(filesVO);

		mv.addObject("file", filesVO);
		
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
