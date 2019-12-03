package com.mid.pro.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@GetMapping(value = "memberGrade")
	public void memberGrade()throws Exception{
		
	}
	
	@PostMapping(value = "memberGrade")
	public ModelAndView memberGrade(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberServiceImpl.memberGrade(memberVO);		
		mv.setViewName("member/memberGrade");
		mv.addObject("member", result);
		
		return mv;
	}
	
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
	
	///checkId
	@ResponseBody
	@RequestMapping(value = "memberCheckId", method = RequestMethod.GET)
	public int memberCheckId(@RequestParam("id") MemberVO memberVO)throws Exception{
			System.out.println();
			return memberServiceImpl.memberCheckId(memberVO);
							
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
