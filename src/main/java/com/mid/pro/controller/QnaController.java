package com.mid.pro.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

import com.mid.pro.model.MemberVO;
import com.mid.pro.model.QnaVO;
import com.mid.pro.service.QnaService;
import com.mid.pro.service.QnaServiceImpl;
import com.mid.pro.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	
	@Inject
	private QnaServiceImpl qnaServiceImpl;



	//list
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView boardList(Pager pager)throws Exception{
		
		if(pager.getKind().equals("kc")) {
			String date = pager.getSearch();
			date = date.replace("-", "/");
			pager.setSearch(date);
		}
		List<QnaVO> list = qnaService.List(pager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pager", pager);
		mv.addObject("list", list);
		mv.addObject("qna", "qna");
		mv.setViewName("qna/qnaList");

		
		return mv;
	}

	
	//select One
	@RequestMapping(value = "qnaSelect", method = RequestMethod.GET)
	public ModelAndView boardSelect(QnaVO qnaVO)throws Exception{
		qnaVO = qnaService.Select(qnaVO);
		ModelAndView mv = new ModelAndView();

		mv.addObject("vo", qnaVO);
		mv.addObject("qna", "qna");
		mv.setViewName("qna/qnaSelect");

			return mv;
	}
	
	//write
	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public ModelAndView Write() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("qna", "qna");
		mv.setViewName("qna/qnaWrite");

		return mv;
	}
	
	@RequestMapping(value="qnaWrite", method = RequestMethod.POST)
	public ModelAndView Write2(QnaVO qnaVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
			int result = qnaService.Write(qnaVO, session);
			String msg = "Write Fail";
			if (result > 0) {
				mv.setViewName("redirect:./qnaList");
			}else {
				mv.addObject("msg", msg);
				mv.addObject("path", "./qnaList");
				mv.setViewName("common/common_result");
			}
		
		return mv;
	}
	//update2
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public ModelAndView Update2(QnaVO qnaVO) throws Exception{
		qnaVO = qnaService.Select(qnaVO);		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", qnaVO);
		mv.addObject("qna", "qna");
		mv.setViewName("qna/qnaUpdate");
		return mv;
	}
	//update
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public ModelAndView Update(QnaVO qnaVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		int result = qnaService.Update(qnaVO, session);
		String msg = "Update Fail";
		if (result > 0) {
			mv.setViewName("redirect:./qnaList");			
		}else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./qnaList");
			mv.setViewName("common/common_result");
		}
		
		return mv;
	}	
	
	//delete
	@RequestMapping(value = "qnaDelete", method = RequestMethod.GET)
	public ModelAndView boardDelete(QnaVO qnaVO) throws Exception{
		int result = qnaService.Delete(qnaVO);
		ModelAndView mv = new ModelAndView();
		String msg = "Delete Fail";
		if (result > 0) {
			mv.setViewName("redirect:./qnaList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./qnaList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	
	
	@RequestMapping(value = "qnaReply", method = RequestMethod.GET)
	public ModelAndView boardReply(QnaVO qnaVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("ㅎㅇ");
		mv.addObject("qna_num", qnaVO.getQna_num());
		System.out.println("ㅎㅇ5");
		mv.addObject("vo", qnaVO);
		System.out.println("ㅎㅇ6");
		mv.setViewName("qna/qnaReply");
		return mv; 
	}
	
	@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
	public ModelAndView boardReply2(QnaVO qnaVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("ㅎㅇ2");
		int result = qnaServiceImpl.boardReply(qnaVO);
		
		if(result>0) {
			mv.addObject("msg", "답글달기 성공");
			System.out.println("ㅎㅇ3");
		}else {
			mv.addObject("msg", "답글달기 실패");
			System.out.println("ㅎㅇ4");
		}
			mv.addObject("path", "./qnaList");
			System.out.println("ㅎㅇ7");
			mv.setViewName("common/common_result");
			
		return mv;
	}
}
