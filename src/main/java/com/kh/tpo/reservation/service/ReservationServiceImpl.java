package com.kh.tpo.reservation.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tpo.member.domain.ReservationInfo;
import com.kh.tpo.member.domain.ReservationInfo2;
import com.kh.tpo.reservation.domain.Passenger;
import com.kh.tpo.reservation.domain.Reservation;
import com.kh.tpo.reservation.store.ReservationStore;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	public ReservationStore rStore;
	
	@Override
	public int insertPassenger(Passenger passenger) {
		return rStore.insertPassenger(passenger);
	}

	@Override
	public int insertReservation(Reservation reservation) {
		return rStore.insertReservation(reservation);
	}

	@Override
	public int insertRInfo(ReservationInfo rInfo) {
		return rStore.insertRInfo(rInfo);
	}

	@Override
	public int insertRInfo(ReservationInfo2 rInfo2) {
		return rStore.insertRInfo(rInfo2);
	}
	
	@Override
	public ArrayList<Reservation> selectReservation() {
		return null;
	}

}
