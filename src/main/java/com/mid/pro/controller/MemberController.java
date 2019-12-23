package com.mid.pro.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	///checkId && checkEmail
	@ResponseBody
	@PostMapping(value = "memberCheckId")
	public int memberCheckId(HttpServletRequest req)throws Exception{
		String id = req.getParameter("id");
		MemberVO memberVO = memberServiceImpl.memberCheckId(id);	
		int result = 0;
		
		if(memberVO != null) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "memberCheckEmail")
	public int memberCheckEmail(HttpServletRequest req)throws Exception{
		String email = req.getParameter("email");
		MemberVO memberVO = memberServiceImpl.memberCheckEmail(email);
		int result = 0;
		
		if(memberVO !=null) {
			result = 1;
		}
		return result;
	}
	
	
	
		
	///////////////////Login
	@GetMapping(value = "memberLogin")
	public void memberLogin()throws Exception{	
		
	}
	
	@PostMapping(value = "memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberServiceImpl.memberLogin(memberVO);		
		if(memberVO !=null) {
			session.setAttribute("member", memberVO);			
			mv.setViewName("redirect:../");
		}else {
			mv.addObject("msg", "로그인에 실패하였습니다");
			mv.addObject("path", "../");
			mv.setViewName("common/common_result");
		}
		
		return mv;
	}
	
	////////////////Logout
	@GetMapping(value = "memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	/////////////////Update
	@GetMapping(value= "memberUpdate")
	public void memberUpdate()throws Exception{
			
	}
	
	@PostMapping(value= "memberUpdate")
	public ModelAndView memberUpdate(MemberVO memberVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberServiceImpl.memberUpdate(memberVO);	
		
		String msg = "회원정보수정이 실패하였습니다. 다시 시도해주세요.";	
		if(result>0) {
			msg = "회원정보수정이 완료되었습니다.";
			session.setAttribute("member", memberVO);
		}
			mv.addObject("msg", msg);
			mv.addObject("path", "../");
			mv.setViewName("common/common_result");
		return mv;
	}
	
	
	///////////////Delete
	@GetMapping(value = "memberDelete")
	public ModelAndView memberDelete(MemberVO memberVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberServiceImpl.memberDelete(memberVO);
		
		String msg = "회원탈퇴에 실패하였습니다. 다시 시도해주세요.";
		if(result>0) {
			msg = "회원탈퇴가 완료되었습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", "../");
		mv.setViewName("common/common_result");
		
		session.invalidate();
				
		return mv;
	}
	
	
	
	/////mypage
	@GetMapping(value = "memberMypage")
	public void memberMypage() throws Exception{
		
		
	}
	
	/////Mylist
	@GetMapping(value = "memberMylist")
	public void memberMylist() throws Exception{
		
		
	}
	

}
