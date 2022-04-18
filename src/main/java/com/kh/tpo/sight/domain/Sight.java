package com.kh.tpo.sight.domain;

public class Sight {

	private int sNo;
	private String sName;
	private String sLocation;
	private String sIntroduce;
	private String sPicture;
	private String restDate;
	private String sParking;
	private String sBabyCarriage;
	private String sPet;
	public Sight() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Sight(int sNo, String sName, String sLocation, String sIntroduce, String sPicture, String restDate,
			String sParking, String sBabyCarriage, String sPet) {
		super();
		this.sNo = sNo;
		this.sName = sName;
		this.sLocation = sLocation;
		this.sIntroduce = sIntroduce;
		this.sPicture = sPicture;
		this.restDate = restDate;
		this.sParking = sParking;
		this.sBabyCarriage = sBabyCarriage;
		this.sPet = sPet;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsLocation() {
		return sLocation;
	}
	public void setsLocation(String sLocation) {
		this.sLocation = sLocation;
	}
	public String getsIntroduce() {
		return sIntroduce;
	}
	public void setsIntroduce(String sIntroduce) {
		this.sIntroduce = sIntroduce;
	}
	public String getsPicture() {
		return sPicture;
	}
	public void setsPicture(String sPicture) {
		this.sPicture = sPicture;
	}
	public String getRestDate() {
		return restDate;
	}
	public void setRestDate(String restDate) {
		this.restDate = restDate;
	}
	public String getsParking() {
		return sParking;
	}
	public void setsParking(String sParking) {
		this.sParking = sParking;
	}
	public String getsBabyCarriage() {
		return sBabyCarriage;
	}
	public void setsBabyCarriage(String sBabyCarriage) {
		this.sBabyCarriage = sBabyCarriage;
	}
	public String getsPet() {
		return sPet;
	}
	public void setsPet(String sPet) {
		this.sPet = sPet;
	}
	@Override
	public String toString() {
		return "Sight [sNo=" + sNo + ", sName=" + sName + ", sLocation=" + sLocation + ", sIntroduce=" + sIntroduce
				+ ", sPicture=" + sPicture + ", restDate=" + restDate + ", sParking=" + sParking + ", sBabyCarriage="
				+ sBabyCarriage + ", sPet=" + sPet + "]";
	}
	
	

	
}
