package com.mid.pro.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mid.pro.model.MemberVO;
import com.mid.pro.service.MemberServiceImpl;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Inject
	private MemberServiceImpl memberServiceImpl;


	////////////Join
	@GetMapping(value = "memberJoin")	
	public void memberJoin()throws Exception{

	}

	
	@PostMapping(value = "memberJoin")
	public ModelAndView memberJoin(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberServiceImpl.memberJoin(memberVO);

		if(result>0) {
			mv.addObject("msg", "Join");
		}else {
			mv.addObject("msg", "Fail");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/common_result");

		return mv;
	}
	
	
	///////////////////Login
	@GetMapping(value = "memberLogin")
	public void memberLogin()throws Exception{	
		
	}
	
	@PostMapping(value = "memberLogin")
	public String memberLogin(MemberVO memberVO, HttpSession session)throws Exception{
		memberVO = memberServiceImpl.memberLogin(memberVO);		
		if(memberVO !=null) {
			session.setAttribute("member", memberVO);
		}	
		return "redirect:../";
	}
	
	////////////////Logout
	@GetMapping(value = "memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	/////////////////Update
	@GetMapping(value = "memberUpdate")
	public void memberUpdate()throws Exception{
			
	}
	
	@PostMapping(value = "memberUpdate")
	public String memberUpdate(MemberVO memberVO, HttpSession session)throws Exception{
		int result = memberServiceImpl.memberUpdate(memberVO);		
		if(result>0) {
			session.setAttribute("member", memberVO);
		}
		return "redirect:../";
	}
	
	
	
	//mypage
	@GetMapping(value = "memberMypage")
	public void memberMypage() throws Exception{
		
		
	}
	
	//Mylist
	@GetMapping(value = "memberMylist")
	public void memberMylist() throws Exception{
		
		
	}
	

}
