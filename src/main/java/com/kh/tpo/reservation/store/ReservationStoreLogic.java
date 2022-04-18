package com.kh.tpo.reservation.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tpo.member.domain.ReservationInfo;
import com.kh.tpo.member.domain.ReservationInfo2;
import com.kh.tpo.reservation.domain.Passenger;
import com.kh.tpo.reservation.domain.Reservation;

@Repository
public class ReservationStoreLogic implements ReservationStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPassenger(Passenger passenger) {
		return sqlSession.insert("ReservationMapper.insertPassenger", passenger);
	}

	@Override
	public int insertReservation(Reservation reservation) {
		return sqlSession.insert("ReservationMapper.insertReservation", reservation);
	}
	
	@Override
	public int insertRInfo(ReservationInfo rInfo) {
		return sqlSession.insert("ReservationMapper.insertRInfo", rInfo);
	}
	
	@Override
	public int insertRInfo(ReservationInfo2 rInfo2) {
		return sqlSession.insert("ReservationMapper.insertRInfo2", rInfo2);
	}

	@Override
	public ArrayList<Reservation> selectReservation() {
		// TODO Auto-generated method stub
		return null;
	}
}
