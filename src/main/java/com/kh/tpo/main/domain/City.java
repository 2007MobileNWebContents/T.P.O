package com.kh.tpo.main.domain;

public class City {

	private int cityNo;
	private String cityName;
	private int cConfirmedNum;
	private String cDate;
	
	public City() {}

	public int getCityNo() {
		return cityNo;
	}

	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public int getcConfirmedNum() {
		return cConfirmedNum;
	}

	public void setcConfirmedNum(int cConfirmedNum) {
		this.cConfirmedNum = cConfirmedNum;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	@Override
	public String toString() {
		return "City [cityNo=" + cityNo + ", cityName=" + cityName + ", cConfirmedNum=" + cConfirmedNum + ", cDate="
				+ cDate + "]";
	};
	
	
}
