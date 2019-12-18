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

import com.mid.pro.model.ReservationVO;
import com.mid.pro.model.RestTableVO;
import com.mid.pro.model.RestTable2VO;
import com.mid.pro.model.RestaurantVO;
import com.mid.pro.model.TableViewVO;
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
		List<ReservationVO> reservation = reservationService.reservationCheck(rest_num);

		TableViewVO tableViewVO = new TableViewVO();
		ArrayList<TableViewVO> tarr = new ArrayList<TableViewVO>();

		//시간 쪼개기
		String hh="";//시작시간
//		String mm="";//시작분
		String hh2="";//마감시간
//		String mm2="";//마감분

		for(RestTableVO ta:table){

			//테이블에 있는 시간을 1시간 간격으로 쪼갠다.

			String str = ta.getOpen_time1();
//			System.out.println(str);
			StringTokenizer st = new StringTokenizer(str,":");
//			System.out.println(st);
			
			while(st.hasMoreTokens()){
				hh = st.nextToken();
//				System.out.println("hh="+hh);

			}//오픈시간 쪼개기 while
			
			//마감시간 쪼개기
			String str2 = ta.getClose_time1();
//			System.out.println("str2="+str2);
			StringTokenizer st2 = new StringTokenizer(str2,":");
			while(st2.hasMoreTokens()){
			String nextToken2 = st2.nextToken();
				hh2 = nextToken2;

//			System.out.println("hh="+hh+"hh2="+hh2);

			}//마감시간 쪼개기 while


			//TableViewVO에 담기
			for(int i = Integer.parseInt(hh); i < Integer.parseInt(hh2); i++){
				tableViewVO = new TableViewVO();
				tableViewVO.setRev_time(i);
				tableViewVO.setTable_num(ta.getTable_num());
				tableViewVO.setTable_user(ta.getTable_user());
//				tableViewVO.setRev_min(Integer.parseInt(mm));
//				System.out.println(tableViewVO.getRev_time());
//				System.out.println(tableViewVO.getTable_num());
//				System.out.println(tableViewVO.getTable_user());
				tarr.add(tableViewVO);
			}
			
			
		}//전체  for
		session.setAttribute("rev_date", rev_date);
		mv.addObject("rev_date", session);
		mv.addObject("table", table);
		mv.addObject("table2", table2);
		mv.addObject("vo", restaurantVO);
		mv.addObject("tarr", tarr);
		mv.addObject("backnum", rest_num);
		return mv;
	}
	//예약하기
	@PostMapping(value = "reservationWrite")
	public ModelAndView reservationWrite(ReservationVO reservationVO, RestaurantVO restaurantVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.restSelect(restaurantVO);
		int result = reservationService.reservationWrite(reservationVO);
		if (result > 0) {
			mv.setViewName("redirect:../restaurant/restList");
		} else {
			mv.addObject("msg", "예약에 실패하였습니다.");			
			mv.setViewName("../restaurant/restList");
		}
		return mv;
	}
}
