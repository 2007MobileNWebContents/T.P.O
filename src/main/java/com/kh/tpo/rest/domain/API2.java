package com.kh.tpo.rest.domain;

public class API2 {

	private String reInfo;
	private String pStatus;
	
	
	public API2() {}

	public String getReInfo() {
		return reInfo;
	}

	public void setReInfo(String reInfo) {
		this.reInfo = reInfo;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String string) {
		this.pStatus = string;
	}

	@Override
	public String toString() {
		return "API2 [reInfo=" + reInfo + ", pStatus=" + pStatus + "]";
	}
	

	
	
}
