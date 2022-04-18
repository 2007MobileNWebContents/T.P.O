package com.kh.tpo.reservation.domain;

import java.sql.Date;

public class Passenger {

	// 매개변수
	private int pNo; // 승객번호
	private String pName; // 승객이름
	private String pGender; // 성별
	private String pBirthday; // 생년월일
	private String pNationality; // 국적
	private String pEmail; // 이메일
	private String pPhone; // 전화번호
	
	// 기본 생성자
	public Passenger() {}
	
	// 매개변수 생성자
	public Passenger(int pNo, String pName, String pGender, String pBirthday, String pNationality, String pEmail,
			String pPhone) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.pGender = pGender;
		this.pBirthday = pBirthday;
		this.pNationality = pNationality;
		this.pEmail = pEmail;
		this.pPhone = pPhone;
	}

	// getter/setter
	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpGender() {
		return pGender;
	}

	public void setpGender(String pGender) {
		this.pGender = pGender;
	}

	public String getpBirthday() {
		return pBirthday;
	}

	public void setpBirthday(String pBirthday) {
		this.pBirthday = pBirthday;
	}

	public String getpNationality() {
		return pNationality;
	}

	public void setpNationality(String pNationality) {
		this.pNationality = pNationality;
	}

	public String getpEmail() {
		return pEmail;
	}

	public void setpEmail(String pEmail) {
		this.pEmail = pEmail;
	}

	public String getpPhone() {
		return pPhone;
	}

	public void setpPhone(String pPhone) {
		this.pPhone = pPhone;
	}

	// toString
	@Override
	public String toString() {
		return "Passenger [pNo=" + pNo + ", pName=" + pName + ", pGender=" + pGender + ", pBirthday=" + pBirthday
				+ ", pNationality=" + pNationality + ", pEmail=" + pEmail + ", pPhone=" + pPhone + "]";
	}	
}
