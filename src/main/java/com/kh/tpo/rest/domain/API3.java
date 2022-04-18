package com.kh.tpo.rest.domain;

public class API3 {

	private String checkIn;
	private String checkout;
	private int rTotal;
	private int pTotal;
	private String reFacility;
	private String reUrl;


	public API3() {}
	
	public String getReUrl() {
		return reUrl;
	}

	public void setReUrl(String reUrl) {
		this.reUrl = reUrl;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getrTotal() {
		return rTotal;
	}

	public void setrTotal(int rTotal) {
		this.rTotal = rTotal;
	}

	public int getpTotal() {
		return pTotal;
	}

	public void setpTotal(int pTotal) {
		this.pTotal = pTotal;
	}

	public String getReFacility() {
		return reFacility;
	}

	public void setReFacility(String reFacility) {
		this.reFacility = reFacility;
	}

	@Override
	public String toString() {
		return "API3 [checkIn=" + checkIn + ", checkout=" + checkout + ", rTotal=" + rTotal + ", pTotal=" + pTotal
				+  ", reFacility=" + reFacility + ", reUrl=" + reUrl + "]";
	}

	
	
	
	

	
	
}
