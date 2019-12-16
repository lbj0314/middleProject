package com.mid.pro.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mid.pro.model.ReservationVO;

@Repository
public class ReservationDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "reservationMapper.";
	
	//예약하기
	public int reservationWrite(ReservationVO reservationVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "reservationWrite", reservationVO);
	}
	//예약 확인
	public List<ReservationVO> reservationCheck(int rest_num) throws Exception{
		return sqlSession.selectList(NAMESPACE + "reservationCheck", rest_num);
	}
	//회원이 예약 내역 선택해서 확인
	public ReservationVO reservationSelect(ReservationVO restReservationVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "reservationSelect", restReservationVO);
	}
	//예약 삭제
	public int reservationDelete(ReservationVO reservationVO) throws Exception{
		return sqlSession.delete(NAMESPACE + "reservationDelete", reservationVO);
	}
}
