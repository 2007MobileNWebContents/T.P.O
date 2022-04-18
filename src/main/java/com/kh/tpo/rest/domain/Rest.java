package com.kh.tpo.rest.domain;


public class Rest {
	
	private int reNo;
	private String reName;
	private String reAddr;
	private String reImage;
	private String rePhone;
	private String reUrl;
	private String reInfo;
	private String checkIn;
	private String checkout;
	private int rTotal;
	private int pTotal;
	private String pStatus;
	private String reFacility;
	private int clcik;
	private int sumPrice;
	private int rowMin;
	
	public Rest() {}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public String getReName() {
		return reName;
	}

	public void setReName(String reName) {
		this.reName = reName;
	}

	public String getReAddr() {
		return reAddr;
	}

	public void setReAddr(String reAddr) {
		this.reAddr = reAddr;
	}

	public String getReImage() {
		return reImage;
	}

	public void setReImage(String reImage) {
		this.reImage = reImage;
	}

	public String getRePhone() {
		return rePhone;
	}

	public void setRePhone(String rePhone) {
		this.rePhone = rePhone;
	}

	public String getReUrl() {
		return reUrl;
	}

	public void setReUrl(String reUrl) {
		this.reUrl = reUrl;
	}

	public String getReInfo() {
		return reInfo;
	}

	public void setReInfo(String reInfo) {
		this.reInfo = reInfo;
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

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public String getReFacility() {
		return reFacility;
	}

	public void setReFacility(String reFacility) {
		this.reFacility = reFacility;
	}

	public int getClcik() {
		return clcik;
	}

	public void setClcik(int clcik) {
		this.clcik = clcik;
	}

	public int getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(int sumPrice) {
		this.sumPrice = sumPrice;
	}

	public int getRowMin() {
		return rowMin;
	}

	public void setRowMin(int rowMin) {
		this.rowMin = rowMin;
	}

	@Override
	public String toString() {
		return "Rest [reNo=" + reNo + ", reName=" + reName + ", reAddr=" + reAddr + ", reImage=" + reImage
				+ ", rePhone=" + rePhone + ", reUrl=" + reUrl + ", reInfo=" + reInfo + ", checkIn=" + checkIn
				+ ", checkout=" + checkout + ", rTotal=" + rTotal + ", pTotal=" + pTotal + ", pStatus=" + pStatus
				+ ", reFacility=" + reFacility + ", clcik=" + clcik + ", sumPrice=" + sumPrice + ", rowMin=" + rowMin
				+ "]";
	}

	
	
	

}
