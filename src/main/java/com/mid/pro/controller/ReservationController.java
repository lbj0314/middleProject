package com.mid.pro.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mid.pro.model.MemberVO;
import com.mid.pro.model.PayVO;
import com.mid.pro.model.Reservation2VO;
import com.mid.pro.model.ReservationCheckVO;
import com.mid.pro.model.ReservationVO;
import com.mid.pro.model.RestTableVO;
import com.mid.pro.model.RestTable2VO;
import com.mid.pro.model.RestaurantVO;
import com.mid.pro.model.TableViewVO;
import com.mid.pro.service.MemberServiceImpl;
import com.mid.pro.service.ReservationService;
import com.mid.pro.service.RestTableService;
import com.mid.pro.service.RestaurantService;

@Controller
@RequestMapping("/reservation/**")
public class ReservationController {

	@Inject
	private RestaurantService restaurantService;
	@Inject
	private RestTableService restTableService;
	@Inject
	private ReservationService reservationService;
	@Inject
	private MemberServiceImpl memberServiceImpl;

	//first calendar
	@GetMapping("reservationForm")
	public ModelAndView fcal(RestaurantVO restaurantVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.restSelect(restaurantVO);
		mv.addObject("session", session);
		mv.addObject("vo", restaurantVO);
		mv.setViewName("reservation/reservationForm");
		return mv;
	}

	//calendar
	@PostMapping("calendar")
	public ModelAndView cal(RestaurantVO restaurantVO, int rest_num, HttpSession session, @RequestParam("rev_date") String rev_date) throws Exception{
		ModelAndView mv = new ModelAndView();
		//테이블
		List<RestTableVO> table = reservationService.reservationTable(rest_num);
		//테이블 Join
		List<RestTable2VO> table2 = reservationService.reservationTable2(rest_num);
		//가게 정보
		restaurantVO = restaurantService.restSelect(restaurantVO);
		//예약된 정보
		List<ReservationVO> reservationTableCheck = reservationService.reservationTableCheck(rest_num);

		TableViewVO tableViewVO = new TableViewVO();
		ArrayList<TableViewVO> tarr = new ArrayList<TableViewVO>();

		//시간 쪼개기
		String hh="";//시작시간
		String mm="";
		String hh2="";//마감시간
		String mm2="";
		for(RestTableVO ta:table){

			//테이블에 있는 시간을 1시간 간격으로 쪼갠다.

			String str = ta.getOpen_time();
			System.out.println(str);
			StringTokenizer st = new StringTokenizer(str,":");
			System.out.println(st);

			while(st.hasMoreTokens()){
				hh = st.nextToken();
				mm = st.nextToken();
				System.out.println("hh="+hh+"mm="+mm);
			}//오픈시간 쪼개기 while

			//마감시간 쪼개기
			String str2 = ta.getClose_time();
			System.out.println("str2="+str2);
			StringTokenizer st2 = new StringTokenizer(str2,":");
			while(st2.hasMoreTokens()){
				hh2 = st2.nextToken();
				mm2 = st2.nextToken();
				System.out.println("hh2:"+hh2+"mm2="+mm2);
			}//마감시간 쪼개기 while

			//TableViewVO에 담기
			for(int i = Integer.parseInt(hh); i < Integer.parseInt(hh2); i++){
				tableViewVO = new TableViewVO();
				tableViewVO.setRev_time(i+":00");
				tableViewVO.setTable_num(ta.getTable_num());
				tableViewVO.setTable_user(ta.getTable_user());
				tarr.add(tableViewVO);
			}


		}//전체  for
		session.setAttribute("rev_date", rev_date);
		mv.addObject("rev_date", session);
		mv.addObject("table", table);
		mv.addObject("table2", table2);
		mv.addObject("revTableChk", reservationTableCheck);
		mv.addObject("vo", restaurantVO);
		mv.addObject("tarr", tarr);
		mv.addObject("backnum", rest_num);
		return mv;
	}
	//예약하기
	@RequestMapping(value = "reservationWrite")
	public ModelAndView reservationWrite(ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();

		int result = reservationService.reservationWrite(reservationVO);
		if (result > 0) {
			mv.setViewName("redirect:../restaurant/restList");
		} else {
			mv.addObject("msg", "예약에 실패하였습니다.");			
			mv.setViewName("../restaurant/restList");
		}
		return mv;
	}
	//가게가 예약 내역 확인
	@GetMapping(value = "reservationCheck")
	public ModelAndView reservationCheck(int rest_num, RestaurantVO restaurantVO, ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ReservationCheckVO> list = reservationService.reservationCheck(rest_num);
		restaurantVO = restaurantService.restSelect(restaurantVO);
		reservationVO = reservationService.reservationSelect(reservationVO);

		mv.addObject("list", list);
		mv.addObject("rev", reservationVO);
		mv.addObject("rest", restaurantVO);
		mv.setViewName("reservation/reservationCheck");
		return mv;
	}
	//가게가 예약 취소
	//	@PostMapping(value = "reservationDelete")
	//	public ModelAndView reservaiontDelete(HttpSession session,
	//			@RequestParam(value = "check[]") List<String> chArr, ReservationVO reservationVO, MemberVO memberVO) throws Exception{
	//		ModelAndView mv = new ModelAndView();
	//		int rev_num = 0;
	//		int result = 0;
	//		memberVO = (MemberVO) session.getAttribute("member");
	//		String member_name = memberVO.getId();
	//		String msg = "예약 취소에 실패하였습니다.";
	//		if(memberVO != null) {
	//			reservationVO.setMember_name(member_name);
	//
	//			for(String i : chArr) {   
	//				rev_num = Integer.parseInt(i);
	//				reservationVO.setRev_num(rev_num);
	//				result = reservationService.reservationDelete(reservationVO);
	//			}   
	//		}  
	//		if (result > 0) {
	//			mv.setViewName("redirect:./reservationCheck");
	//		} else {
	//			mv.addObject("msg", msg);
	//			mv.addObject("path", "./reservationCheck");
	//			mv.setViewName("common/common_result");
	//		}
	//		return mv;
	//	}
	@GetMapping(value = "reservationDelete")
	public ModelAndView reservationDelete(ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = reservationService.reservationDelete(reservationVO);
		String msg = "예약 취소에 실패하였습니다.";
		if (result > 0) {
			mv.setViewName("redirect:../restaurant/restList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./reservationCheck");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//회원이 예약 내역 확인
	@GetMapping(value = "reservationCheck2")
	public ModelAndView reservationCheck2(int member_num) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Reservation2VO> list = reservationService.reservationCheck2(member_num);

		mv.addObject("list", list);
		mv.setViewName("reservation/reservationCheck2");
		return mv;
	}
	//회원이 예약 취소
	@GetMapping(value = "reservationDelete2")
	public ModelAndView reservationDelete2(ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = reservationService.reservationDelete2(reservationVO);
		String msg = "예약 취소에 실패하였습니다.";
		if (result > 0) {
			mv.setViewName("redirect:./reservationCheck2");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./reservationCheck2");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//pay
	@PostMapping(value = "pay")
	public ModelAndView pay(PayVO payVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		payVO = reservationService.pay(payVO);
		
		mv.addObject("pay", payVO);
		mv.setViewName("reservation/pay");
		return mv;
	}
	//reservation
	@GetMapping(value = "reservation")
	public ModelAndView reservation(ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		reservationVO = reservationService.reservationSelect(reservationVO);
		
		mv.addObject("vo", reservationVO);
		mv.setViewName("reservaton/reservation");
		return mv;
	}
}
