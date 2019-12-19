package com.mid.pro.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mid.pro.dao.ReservationDAO;
import com.mid.pro.model.Reservation2VO;
import com.mid.pro.model.ReservationCheckVO;
import com.mid.pro.model.ReservationVO;
import com.mid.pro.model.RestTableVO;
import com.mid.pro.model.RestTable2VO;

@Service
public class ReservationService {
	
	@Inject
	private ReservationDAO reservationDAO;
	
	//테이블 폼
	public List<RestTableVO> reservationTable(int rest_num) throws Exception{
		return reservationDAO.reservationTable(rest_num);
	}
	//테이블 폼, 예약 JOIN
	public List<RestTable2VO> reservationTable2(int rest_num) throws Exception{
		return reservationDAO.reservationTable2(rest_num);
	}
	//예약된 정보 확인
	public List<ReservationVO> reservationTableCheck(int rest_num) throws Exception{
		return reservationDAO.reservationTableCheck(rest_num);
	}
	//예약하기
	public int reservationWrite(ReservationVO reservationVO) throws Exception{
		return reservationDAO.reservationWrite(reservationVO);
	}
	//예약 하나 가져오기
	public ReservationVO reservationSelect(ReservationVO reservationVO) throws Exception{
		return reservationDAO.reservationSelect(reservationVO);
	}
	//가게가 예약 내역 확인
	public List<ReservationCheckVO> reservationCheck(int rest_num) throws Exception{
		return reservationDAO.reservationCheck(rest_num);
	}
	//가게가 예약 취소
	public int reservationDelete(ReservationVO reservationVO) throws Exception{
		return reservationDAO.reservationDelete(reservationVO);
	}
	//회원이 예약 내역 확인
	public List<Reservation2VO> reservationCheck2(int member_num) throws Exception{
		return reservationDAO.reservationCheck2(member_num);
	}
	//회원이 예약 취소
	public int reservationDelete2(ReservationVO reservationVO) throws Exception{
		return reservationDAO.reservationDelete2(reservationVO);
	}
}
