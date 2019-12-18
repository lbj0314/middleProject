package com.mid.pro.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mid.pro.dao.ReservationDAO;
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
	//예약하기
	public int reservationWrite(ReservationVO reservationVO) throws Exception{
		return reservationDAO.reservationWrite(reservationVO);
	}
	//예약확인
	public List<ReservationVO> reservationCheck(int rest_num) throws Exception{
		return reservationDAO.reservationCheck(rest_num);
	}
	//회원이 예약 내역 선택해서 확인
	public ReservationVO reservationSelect(ReservationVO reservationVO) throws Exception{
		return reservationDAO.reservationSelect(reservationVO);
	}
	//예약 삭제
	public int reservationDelete(ReservationVO reservationVO) throws Exception{
		return reservationDAO.reservationDelete(reservationVO);
	}
}
