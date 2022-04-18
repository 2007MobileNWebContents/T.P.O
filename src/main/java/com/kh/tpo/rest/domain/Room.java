package com.kh.tpo.rest.domain;

public class Room {
	
	private int reNo;
	private int rNo;
	private String roName;
	private int roPrice;
	private int pLimit;
	private String roInfo;
	private String roFacility;
	private String roSize;
	private String roImage;
	private int pMaxCount;
	private int roCount;
	
	public Room() {}

	public int getReNo() {
		return reNo;
	}

	public int setReNo(int reNo) {
		return this.reNo = reNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getRoName() {
		return roName;
	}

	public void setRoName(String roName) {
		this.roName = roName;
	}

	public int getRoPrice() {
		return roPrice;
	}

	public void setRoPrice(int roPrice) {
		this.roPrice = roPrice;
	}

	public int getpLimit() {
		return pLimit;
	}

	public void setpLimit(int pLimit) {
		this.pLimit = pLimit;
	}

	public String getRoInfo() {
		return roInfo;
	}

	public void setRoInfo(String roInfo) {
		this.roInfo = roInfo;
	}

	public String getRoFacility() {
		return roFacility;
	}

	public void setRoFacility(String roFacility) {
		this.roFacility = roFacility;
	}

	public String getRoSize() {
		return roSize;
	}

	public void setRoSize(String roSize) {
		this.roSize = roSize;
	}

	public String getRoImage() {
		return roImage;
	}

	public void setRoImage(String roImage) {
		this.roImage = roImage;
	}

	public int getpMaxCount() {
		return pMaxCount;
	}

	public void setpMaxCount(int pMaxCount) {
		this.pMaxCount = pMaxCount;
	}

	public int getRoCount() {
		return roCount;
	}

	public void setRoCount(int roCount) {
		this.roCount = roCount;
	}

	@Override
	public String toString() {
		return "Room [reNo=" + reNo + ", rNo=" + rNo + ", roName=" + roName + ", roPrice=" + roPrice + ", pLimit="
				+ pLimit + ", roInfo=" + roInfo + ", roFacility=" + roFacility + ", roSize=" + roSize + ", roImage="
				+ roImage + ", pMaxCount=" + pMaxCount + ", roCount=" + roCount + "]";
	}

	public Room(int reNo, int rNo, String roName, int roPrice, int pLimit, String roInfo, String roFacility,
			String roSize, String roImage, int pMaxCount, int roCount) {
		super();
		this.reNo = reNo;
		this.rNo = rNo;
		this.roName = roName;
		this.roPrice = roPrice;
		this.pLimit = pLimit;
		this.roInfo = roInfo;
		this.roFacility = roFacility;
		this.roSize = roSize;
		this.roImage = roImage;
		this.pMaxCount = pMaxCount;
		this.roCount = roCount;
	}

	
	
	
	
	
	

}
