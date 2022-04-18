package com.kh.tpo.reservation.service;

import java.util.ArrayList;

import com.kh.tpo.member.domain.ReservationInfo;
import com.kh.tpo.member.domain.ReservationInfo2;
import com.kh.tpo.reservation.domain.Passenger;
import com.kh.tpo.reservation.domain.Reservation;

public interface ReservationService {

	/**
	 * 승객 정보 추가
	 * @param passenger
	 * @return
	 */
	public int insertPassenger(Passenger passenger);
	
	/**
	 * 예약 정보 추가
	 * @param reservation
	 * @return
	 */
	public int insertReservation(Reservation reservation);
	
	/**
	 * 마이페이지에서 항공예약정보를 출력하기 위해 항공예약 정보 추가(편도)
	 * @param rInfo
	 * @return
	 */
	public int insertRInfo(ReservationInfo rInfo);
	
	/**
	 * 마이페이지에서 항공예약정보를 출력하기 위해 항공예약 정보 추가(왕복)
	 * @param rInfo2
	 * @return
	 */
	public int insertRInfo(ReservationInfo2 rInfo2);
	
	/**
	 * 예약 완료 후 예약내용 출력 
	 * @return
	 */
	public ArrayList<Reservation> selectReservation();

	
}
