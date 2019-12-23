package com.mid.pro.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mid.pro.model.NoticeVO;
import com.mid.pro.service.NoticeService;
import com.mid.pro.util.Pager;

@Controller
@RequestMapping(value = "/notice/**")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;
//----------------------------------------------------------------------------------	
	//  noticeList 5페이지 이동 Controller
	@RequestMapping("noticeTermsofUse")
	public ModelAndView notice(ModelAndView mv) throws Exception {
		mv.setViewName("notice/noticeTermsofUse");
		return mv;
	}		
	@RequestMapping("noticeNonmemberUserPolicy")
	public ModelAndView notice2(ModelAndView mv) throws Exception {

		mv.setViewName("notice/noticeNonmemberUserPolicy");
		return mv;
	}		
	@RequestMapping("noticePrivacyPolicy")
	public ModelAndView notice3(ModelAndView mv) throws Exception {
		mv.setViewName("notice/noticePrivacyPolicy");
		return mv;
	}
	@RequestMapping("noticeLocationBasedServiceTerms")
	public ModelAndView notice4(ModelAndView mv) throws Exception {
		mv.setViewName("notice/noticeLocationBasedServiceTerms");
		return mv;
	}	
	@RequestMapping("noticeCommunityGuidelines")
	public ModelAndView notice5(ModelAndView mv) throws Exception {
		mv.setViewName("notice/noticeCommunityGuidelines");
		return mv;
	}	

	//----------------------------------------------------------------------------------		
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public ModelAndView boardSelect(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noticeVO = noticeService.Select(noticeVO);
		mv.addObject("vo", noticeVO);
		mv.setViewName("notice/noticeSelect");		
		return mv;
		
	}

	@GetMapping(value = "noticeList")
	public ModelAndView List(NoticeVO noticeVO,Pager pager) throws Exception{
		if(pager.getKind().equals("kc")) {
			String date = pager.getSearch();
			date = date.replace("-", "/");
			pager.setSearch(date);
		}
		List<NoticeVO> ar = noticeService.List(pager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.setViewName("notice/noticeList");
		return mv;
	}
		

	@GetMapping(value = "noticeWrite")
	public ModelAndView boardWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("notice", "notice");
		mv.setViewName("notice/noticeWrite");
		
		return mv;
	}
	
	@PostMapping(value = "noticeWrite")
	public ModelAndView boardWrite(NoticeVO noticeVO, MultipartFile[] file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.Write(noticeVO, file, session);
		String msg = "Write Fail";
		if (result > 0 ||  noticeVO.getId() != null ) {
			mv.setViewName("redirect:./noticeList");
		}else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./noticeList");
			mv.setViewName("common/common_result");
		}
	
	return mv;
}
	
	//boardDelete
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public String boardDelete(NoticeVO noticeVO)throws Exception{
		int result = noticeService.Delete(noticeVO);
		return "redirect:./noticeList";
	}
	
	//boardUpdate post
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public String boardUpdate2(NoticeVO noticeVO, MultipartFile[] file, HttpSession session)throws Exception{
		int result=noticeService.Update(noticeVO, file, session);
		String view = "redirect:./noticeList";
		if(result>0) {
			view="redirect:./noticeList?num="+noticeVO.getNotice_num();
		}
		return view;
	}	
	
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public ModelAndView boardUpdate(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noticeVO = noticeService.Select(noticeVO);
		mv.addObject("vo", noticeVO);
		mv.setViewName("notice/noticeUpdate");
		return mv;
	}

	
}
