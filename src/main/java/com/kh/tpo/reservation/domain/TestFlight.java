package com.kh.tpo.reservation.domain;

public class TestFlight {

   private String vihicleId; // 항공편명
   private String airlineNm; // 항공사명
   private Long depPlandTime; // 출발시간
   private Long arrPlandTime; // 도착시간
   private String depAirportNm; // 출발지
   private String arrAirportNm; // 도착지
   private Long economyCharge; // 일반석 운임료
   private Long prestigeCharge; // 비즈니스석 운임료
   
   public String getVihicleId() {
      return vihicleId;
   }
   public void setVihicleId(String vihicleId) {
      this.vihicleId = vihicleId;
   }
   public String getAirlineNm() {
      return airlineNm;
   }
   public void setAirlineNm(String airlineNm) {
      this.airlineNm = airlineNm;
   }
   public Long getDepPlandTime() {
      return depPlandTime;
   }
   public void setDepPlandTime(Long depPlandTime) {
      this.depPlandTime = depPlandTime;
   }
   public Long getArrPlandTime() {
      return arrPlandTime;
   }
   public void setArrPlandTime(Long arrPlandTime) {
      this.arrPlandTime = arrPlandTime;
   }
   public String getDepAirportNm() {
      return depAirportNm;
   }
   public void setDepAirportNm(String depAirportNm) {
      this.depAirportNm = depAirportNm;
   }
   public String getArrAirportNm() {
      return arrAirportNm;
   }
   public void setArrAirportNm(String arrAirportNm) {
      this.arrAirportNm = arrAirportNm;
   }
   public Long getEconomyCharge() {
      return economyCharge;
   }
   public void setEconomyCharge(Long economyCharge) {
      this.economyCharge = economyCharge;
   }
   public Long getPrestigeCharge() {
      return prestigeCharge;
   }
   public void setPrestigeCharge(Long prestigeCharge) {
      this.prestigeCharge = prestigeCharge;
   }
   @Override
   public String toString() {
      return "TestFlight [vihicleId=" + vihicleId
            + ", airlineNm=" + airlineNm + ", depPlandTime=" + depPlandTime + ", arrPlandTime=" + arrPlandTime
            + ", depAirportNm=" + depAirportNm + ", arrAirportNm=" + arrAirportNm + ", economyCharge="
            + economyCharge + ", prestigeCharge=" + prestigeCharge + "]";
   }
   
   
}

