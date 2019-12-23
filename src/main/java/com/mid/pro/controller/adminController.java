package com.mid.pro.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mid.pro.model.MemberVO;
import com.mid.pro.service.MemberServiceImpl;
import com.mid.pro.util.Pager;

@RequestMapping("/admin/**")
@Controller
public class adminController {

	@Inject
	private MemberServiceImpl memberServiceImpl;


	@RequestMapping("allmember")
	public ModelAndView amember(ModelAndView mv, MemberVO memberVO, Pager pager) throws Exception {
		System.out.println(pager.getSearch());

		if (pager.getKind().equals("kc")) {
			String date = pager.getSearch();
			date = date.replace("-", "/");
			pager.setSearch(date);
		}
		List<MemberVO> ar = memberServiceImpl.List(pager);
		mv.addObject("list", ar);
		mv.setViewName("admin/allmember");
		mv.addObject("pager", pager);
		return mv;
	}

	@GetMapping(value = "allmemberUpdate")
	public ModelAndView allmemberUpdate(String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();

		memberVO.setId(id);

		memberVO = memberServiceImpl.memberSelect(memberVO);

		mv.addObject("vo", memberVO);
		mv.setViewName("admin/allmemberUpdate");// 절대경로

		return mv;

	}

	@GetMapping(value = "allmemberDelete")
	public ModelAndView memberDelete(MemberVO memberVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = memberServiceImpl.memberDelete(memberVO);

		String msg = "회원 제명 실패";
		if (result > 0) {
			msg = "회원 제명 성공";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", "./allmember");
		mv.setViewName("common/common_result");

		// session.invalidate(); 자동 로그아웃

		return mv;
	}


	  @PostMapping(value= "allmemberUpdate") 
	  public ModelAndView memberUpdate(MemberVO memberVO, HttpSession session)throws Exception{
	  ModelAndView mv = new ModelAndView(); 
	  int result = memberServiceImpl.memberUpdate2(memberVO);
	  	
	  String msg = "회원정보수정이 실패하였습니다. 다시 시도해주세요."; 
	  if(result>0) { 
	  msg = "회원정보수정이 완료되었습니다.";
	  session.setAttribute("vo", memberVO); 
	  }
	  mv.addObject("msg", msg); 
	  mv.addObject("path", "./allmember");
	  mv.setViewName("common/common_result");
	  
	  return mv; 
	  }
	 
	//adminPage1~4 이동

	  		@RequestMapping("adminPage")
	  		public ModelAndView admin(ModelAndView mv) throws Exception {
		  
	  		mv.setViewName("admin/adminPage");
	  		return mv;
	  		}


		  @RequestMapping("adminPage2")
		  public ModelAndView adminPage2(ModelAndView mv) throws Exception {
			  
			  mv.setViewName("admin/adminPage2");
			  return mv;
		  }
		  
		  @RequestMapping("adminPage3")
		  public ModelAndView adminPage3(ModelAndView mv) throws Exception {
			  
			  mv.setViewName("admin/adminPage3");
			  return mv;
		  }	
			
		  @RequestMapping("adminPage4")
		  public ModelAndView adminPage4(ModelAndView mv) throws Exception {
			  
			  mv.setViewName("admin/adminPage4");
			  return mv;
		  }
		  
		  
		  
		  
		  
		  

}
