package com.kh.tpo.sight.domain;

public class MainSight {
	
	private int sNo;
	private String sName;
	private String sLocation;
	private String sPicture;

	public MainSight() {}

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

	public String getsPicture() {
		return sPicture;
	}

	public void setsPicture(String sPicture) {
		this.sPicture = sPicture;
	}

	@Override
	public String toString() {
		return "MainSight [sNo=" + sNo + ", sName=" + sName + ", sLocation=" + sLocation + ", sPicture=" + sPicture
				+ "]";
	}
	
	
}
