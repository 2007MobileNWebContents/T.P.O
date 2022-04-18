package com.kh.tpo.reservation.domain;

public class ScheduleSearch {

	// 매개변수
	private String sVihicleId;
	private String sAirlineNm; 
	private String sDepPlandTime; // 검색에서 가장 필요한 부분
	private String sDepAirportNm;
	private String sArrAirportNm;
	private String searchAirline; // 항공사 검색
	private String searchTime; // 시간 검색
	private int adultCount; // 성인 인원수
	private int childCount; // 소아 인원수
	private int infantCount; // 유아 인원수
	private boolean cookieDel; // 쿠키 삭제
	
	// 기본 생성자
	public ScheduleSearch() {}

	// 매개변수 생성자
	public ScheduleSearch(String sVihicleId, String sAirlineNm, String sDepPlandTime, String sDepAirportNm, String sArrAirportNm,
			String searchAirline, String searchTime, int adultCount, int childCount, int infantCount, boolean cookieDel) {
		super();
		this.sVihicleId = sVihicleId;
		this.sAirlineNm = sAirlineNm;
		this.sDepPlandTime = sDepPlandTime;
		this.sDepAirportNm = sDepAirportNm;
		this.sArrAirportNm = sArrAirportNm;
		this.searchAirline = searchAirline;
		this.searchTime = searchTime;
		this.adultCount = adultCount;
		this.childCount = childCount;
		this.infantCount = infantCount;
		this.cookieDel = cookieDel;
	}

	// getter/setter
	public String getsVihicleId() {
		return sVihicleId;
	}
	
	public void setsVihicleId(String sVihicleId) {
		this.sVihicleId = sVihicleId;
	}
	
	public String getsAirlineNm() {
		return sAirlineNm;
	}
	
	public void setsAirlineNm(String sAirlineNm) {
		this.sAirlineNm = sAirlineNm;
	}
	
	public String getsDepPlandTime() {
		return sDepPlandTime;
	}
	
	public void setsDepPlandTime(String sDepPlandTime) {
		this.sDepPlandTime = sDepPlandTime;
	}
	
	public String getsDepAirportNm() {
		return sDepAirportNm;
	}
	
	public void setsDepAirportNm(String sDepAirportNm) {
		this.sDepAirportNm = sDepAirportNm;
	}
	
	public String getsArrAirportNm() {
		return sArrAirportNm;
	}
	
	public void setsArrAirportNm(String sArrAirportNm) {
		this.sArrAirportNm = sArrAirportNm;
	}
	
	public String getSearchAirline() {
		return searchAirline;
	}
	
	public void setSearchAirline(String searchAirline) {
		this.searchAirline = searchAirline;
	}
	
	public String getSearchTime() {
		return searchTime;
	}
	
	public void setSearchTime(String searchTime) {
		this.searchTime = searchTime;
	}
	
	public int getAdultCount() {
		return adultCount;
	}
	
	public void setAdultCount(int adultCount) {
		this.adultCount = adultCount;
	}
	
	public int getChildCount() {
		return childCount;
	}
	
	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}
	
	public int getInfantCount() {
		return infantCount;
	}
	
	public void setInfantCount(int infantCount) {
		this.infantCount = infantCount;
	}
	
	public boolean isCookieDel() {
		return cookieDel;
	}
	
	public void setCookieDel(boolean cookieDel) {
		this.cookieDel = cookieDel;
	}	

	// toString
	@Override
	public String toString() {
		return "ScheduleSearch [sVihicleId=" + sVihicleId + ", sAirlineNm=" + sAirlineNm + ", sDepPlandTime="
				+ sDepPlandTime + ", sDepAirportNm=" + sDepAirportNm + ", sArrAirportNm="
				+ sArrAirportNm + ", searchAirline=" + searchAirline + ", searchTime=" + searchTime + ", adultCount="
				+ adultCount + ", childCount=" + childCount + ", infantCount=" + infantCount + ", cookieDel="
				+ cookieDel + "]";
	}
}
