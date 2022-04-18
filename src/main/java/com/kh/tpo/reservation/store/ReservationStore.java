package com.kh.tpo.reservation.store;

import java.util.ArrayList;

import com.kh.tpo.member.domain.ReservationInfo;
import com.kh.tpo.member.domain.ReservationInfo2;
import com.kh.tpo.reservation.domain.Passenger;
import com.kh.tpo.reservation.domain.Reservation;

public interface ReservationStore {

	public int insertPassenger(Passenger passenger);
	public int insertReservation(Reservation reservation);
	public int insertRInfo(ReservationInfo rInfo);
	public int insertRInfo(ReservationInfo2 rInfo2);
	public ArrayList<Reservation> selectReservation();
	
}
