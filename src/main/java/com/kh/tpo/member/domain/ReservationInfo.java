package com.kh.tpo.member.domain;

import java.sql.Date;

public class ReservationInfo {

	private int riNo; // 항공예약 번호
	private int enNo;	// 예매등록 번호
	private String riVihicleId; // 항공편
	private String riDepartureArea; // 출발지
	private String riArrivalArea;      // 도착지
	private String riDepartureDate; // 출발일자 + 시간
	private String riArrivalDate;		// 도착일자 + 시간
	private int riFare;					// 예매금액
	private String riSeatGrade;	 	// 좌석등급
	private int rPeople;				// 인원
	private Date rDate;				// 예매일자
	
	public ReservationInfo() {}

	
	
	public int getrPeople() {
		return rPeople;
	}

	public void setrPeople(int rPeople) {
		this.rPeople = rPeople;
	}

	public Date getrDate() {
		return rDate;
	}



	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}



	public int getRiNo() {
		return riNo;
	}

	public void setRiNo(int riNo) {
		this.riNo = riNo;
	}

	public int getEnNo() {
		return enNo;
	}

	public void setEnNo(int enNo) {
		this.enNo = enNo;
	}

	public String getRiVihicleId() {
		return riVihicleId;
	}

	public void setRiVihicleId(String riVihicleId) {
		this.riVihicleId = riVihicleId;
	}

	public String getRiDepartureArea() {
		return riDepartureArea;
	}

	public void setRiDepartureArea(String riDepartureArea) {
		this.riDepartureArea = riDepartureArea;
	}

	public String getRiArrivalArea() {
		return riArrivalArea;
	}

	public void setRiArrivalArea(String riArrivalArea) {
		this.riArrivalArea = riArrivalArea;
	}

	public String getRiDepartureDate() {
		return riDepartureDate;
	}

	public void setRiDepartureDate(String riDepartureDate) {
		this.riDepartureDate = riDepartureDate;
	}

	public String getRiArrivalDate() {
		return riArrivalDate;
	}

	public void setRiArrivalDate(String riArrivalDate) {
		this.riArrivalDate = riArrivalDate;
	}

	public int getRiFare() {
		return riFare;
	}

	public void setRiFare(int riFare) {
		this.riFare = riFare;
	}

	public String getRiSeatGrade() {
		return riSeatGrade;
	}

	public void setRiSeatGrade(String riSeatGrade) {
		this.riSeatGrade = riSeatGrade;
	}

	@Override
	public String toString() {
		return "ReservationInfo [riNo=" + riNo + ", enNo=" + enNo + ", riVihicleId=" + riVihicleId
				+ ", riDepartureArea=" + riDepartureArea + ", riArrivalArea=" + riArrivalArea + ", riDepartureDate="
				+ riDepartureDate + ", riArrivalDate=" + riArrivalDate + ", riFare=" + riFare + ", riSeatGrade="
				+ riSeatGrade + ", rPeople=" + rPeople + ", rDate=" + rDate + "]";
	}

}
