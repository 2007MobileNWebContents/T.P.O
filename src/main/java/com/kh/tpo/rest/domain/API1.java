package com.kh.tpo.rest.domain;

public class API1 {


	
	private String reName;
	private String reAddr;
	private String reImage;
	private String rePhone;

	
	public API1() {}

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



	@Override
	public String toString() {
		return "API1 [reName=" + reName + ", reAddr=" + reAddr + ", reImage=" + reImage + ", rePhone=" + rePhone
				 + "]";
	}
	
	
	
	
}
