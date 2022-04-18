package com.kh.tpo.main.domain;

public class Urban {
	private int urbanNo;
	private String urbanName;
	private int uConfirmedNum;
	private String uDate;
	
	public Urban() {}

	public int getUrbanNo() {
		return urbanNo;
	}

	public void setUrbanNo(int urbanNo) {
		this.urbanNo = urbanNo;
	}

	public String getUrbanName() {
		return urbanName;
	}

	public void setUrbanName(String urbanName) {
		this.urbanName = urbanName;
	}

	public int getuConfirmedNum() {
		return uConfirmedNum;
	}

	public void setuConfirmedNum(int uConfirmedNum) {
		this.uConfirmedNum = uConfirmedNum;
	}

	public String getuDate() {
		return uDate;
	}

	public void setuDate(String uDate) {
		this.uDate = uDate;
	}

	@Override
	public String toString() {
		return "Urban [urbanNo=" + urbanNo + ", urbanName=" + urbanName + ", uConfirmedNum=" + uConfirmedNum
				+ ", uDate=" + uDate + "]";
	}
	
	
}
