package com.kh.tpo.reservation.domain;

import java.sql.Date;

public class Reservation {

	// 매개변수
	private int enNo; // 예매등록번호
	private String userId; // 회원아이디
	private int pNo; // 승객번호
	private String rDate; // 예매일자
	private int rPeople; // 인원
	
	// 기본 생성자
	public Reservation () {}

	// 매개변수 생성자
	public Reservation(int enNo, String userId, int pNo, String rDate, int rPeople) {
		super();
		this.enNo = enNo;
		this.userId = userId;
		this.pNo = pNo;
		this.rDate = rDate;
		this.rPeople = rPeople;
	}

	// getter/setter
	public int getEnNo() {
		return enNo;
	}

	public void setEnNo(int enNo) {
		this.enNo = enNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public int getrPeople() {
		return rPeople;
	}

	public void setrPeople(int rPeople) {
		this.rPeople = rPeople;
	}

	// toString
	@Override
	public String toString() {
		return "Reservation [enNo=" + enNo + ", userId=" + userId + ", pNo=" + pNo + ", rDate=" + rDate
				+ ", rPeople=" + rPeople + "]";
	}
}
