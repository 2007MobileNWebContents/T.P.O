package com.kh.tpo.member.domain;

import java.sql.Date;

public class ReservationInfo2 {

	private int riNo2;
	private int enNo2;	
	private String riVihicleId2;
	private String riDepartureArea2;
	private String riArrivalArea2;
	private String riDepartureDate2;
	private String riArrivalDate2;
	private int riFare2;
	private String riSeatGrade2;
	
	public ReservationInfo2() {}

	public int getRiNo2() {
		return riNo2;
	}

	public void setRiNo2(int riNo2) {
		this.riNo2 = riNo2;
	}

	public int getEnNo2() {
		return enNo2;
	}

	public void setEnNo2(int enNo2) {
		this.enNo2 = enNo2;
	}

	public String getRiVihicleId2() {
		return riVihicleId2;
	}

	public void setRiVihicleId2(String riVihicleId2) {
		this.riVihicleId2 = riVihicleId2;
	}

	public String getRiDepartureArea2() {
		return riDepartureArea2;
	}

	public void setRiDepartureArea2(String riDepartureArea2) {
		this.riDepartureArea2 = riDepartureArea2;
	}

	public String getRiArrivalArea2() {
		return riArrivalArea2;
	}

	public void setRiArrivalArea2(String riArrivalArea2) {
		this.riArrivalArea2 = riArrivalArea2;
	}

	public String getRiDepartureDate2() {
		return riDepartureDate2;
	}

	public void setRiDepartureDate2(String riDepartureDate2) {
		this.riDepartureDate2 = riDepartureDate2;
	}

	public String getRiArrivalDate2() {
		return riArrivalDate2;
	}

	public void setRiArrivalDate2(String riArrivalDate2) {
		this.riArrivalDate2 = riArrivalDate2;
	}

	public int getRiFare2() {
		return riFare2;
	}

	public void setRiFare2(int riFare2) {
		this.riFare2 = riFare2;
	}

	public String getRiSeatGrade2() {
		return riSeatGrade2;
	}

	public void setRiSeatGrade2(String riSeatGrade2) {
		this.riSeatGrade2 = riSeatGrade2;
	}

	@Override
	public String toString() {
		return "ReservationInfo2 [riNo2=" + riNo2 + ", enNo2=" + enNo2 + ", riVihicleId2=" + riVihicleId2
				+ ", riDepartureArea2=" + riDepartureArea2 + ", riArrivalArea2=" + riArrivalArea2
				+ ", riDepartureDate2=" + riDepartureDate2 + ", riArrivalDate2=" + riArrivalDate2 + ", riFare2="
				+ riFare2 + ", riSeatGrade2=" + riSeatGrade2 + "]";
	}
}
