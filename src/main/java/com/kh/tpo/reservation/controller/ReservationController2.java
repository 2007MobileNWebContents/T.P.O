//package com.kh.tpo.reservation.controller;
//
//import java.io.BufferedReader;
//import java.io.FileOutputStream;
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.net.URLEncoder;
//import java.util.ArrayList;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.xml.parsers.DocumentBuilder;
//import javax.xml.parsers.DocumentBuilderFactory;
//
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.json.simple.JSONValue;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.kh.tpo.member.domain.ReservationInfo;
//import com.kh.tpo.member.domain.ReservationInfo2;
//import com.kh.tpo.reservation.domain.FlightSchedule;
//import com.kh.tpo.reservation.domain.Passenger;
//import com.kh.tpo.reservation.domain.Reservation;
//import com.kh.tpo.reservation.domain.TestFlight;
//import com.kh.tpo.reservation.service.ReservationService;
//
//@Controller
//public class ReservationController2 {
//
//	@Autowired
//	private ReservationService rService;
//
//	// 메인페이지에서 항공권 검색창으로 이동
//	@RequestMapping(value = "reservation.tpo", method = RequestMethod.GET)
//	public String reservationView() {
//		
//		return "reservation/reservation";
//	}
//	
//	// api값 받아오는 메소드
//	public ArrayList<TestFlight> searchair(String sDepAirportNm, String sArrAirportNm, String sDepPlandTime) {
//		String serviceKey = "EU79ymoWzbXgibv9N2xxkCNqTGTWwblmiNhJFJELWKjV322f7TRBlpIflk2DQtvooFmJZajrG9yhnaf1ozQ9ZQ%3D%3D";
//		JSONArray aItem = new JSONArray();
//		ArrayList<TestFlight> fList = new ArrayList<TestFlight>();
//		StringBuilder urlBuilder = new StringBuilder(
//				"http://openapi.tago.go.kr/openapi/service/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /* URL */
//		try {
//			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
//			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /* 한 페이지 결과 수 */
//			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* 페이지 번호 */
//			urlBuilder.append("&" + URLEncoder.encode("depAirportId", "UTF-8") + "=" + URLEncoder.encode(sDepAirportNm, "UTF-8")); /* 출발공항ID */
//			urlBuilder.append("&" + URLEncoder.encode("arrAirportId", "UTF-8") + "=" + URLEncoder.encode(sArrAirportNm, "UTF-8")); /* 도착공항ID */
//			urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "=" + URLEncoder.encode(sDepPlandTime, "UTF-8")); /* 출발일 */
//			urlBuilder.append("&" + URLEncoder.encode("airlineId", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* 항공사ID */
//			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 형식 */
//			URL url = new URL(urlBuilder.toString());
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			conn.setRequestMethod("GET");
//			conn.setRequestProperty("Content-type", "application/json");
//			//System.out.println("Response code: " + conn.getResponseCode());
//			BufferedReader rd;
//			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			} else {
//				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//			}
//			StringBuilder sb = new StringBuilder();
//			String line;
//			while ((line = rd.readLine()) != null) {
//				sb.append(line);
//			}
//			rd.close();
//			// conn.disconnect();
//			// System.out.println(sb.toString());
//
//			FlightSchedule fsSchedule = null;
//			ArrayList<FlightSchedule> fsList = new ArrayList<FlightSchedule>();
//
//			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
//			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
//
//			// StringBuffer에 저장된 값을 FileOutputStream을 이용해서 파일을 만든다
//			FileOutputStream output = new FileOutputStream("./FlightSchedule");
//			output.write(sb.toString().getBytes());
//			output.close();
//
//			// Object obj = JSONValue.parse(new InputStreamReader(conn.getInputStream()));
//			Object obj = JSONValue.parse(sb.toString());
//
//			// JSON 데이터를 JSONObject타입으로 만들어줌.
//			JSONObject jObj = (JSONObject) obj;
//			// System.out.println(jObj);
//
//			JSONObject jResponse = (JSONObject) jObj.get("response");
//			// System.out.println(j_response);
//
//			JSONObject jBody = (JSONObject) jResponse.get("body");
//			// System.out.println(j_body);
//
//			JSONObject jItems = (JSONObject) jBody.get("items");
//			// System.out.println(j_items);
//
//			aItem = (JSONArray) jItems.get("item");
//			// System.out.println(aItem);
//
//			for (int i = 0; i < aItem.size(); i++) {
//				TestFlight flight = new TestFlight();
//				JSONObject reservationInfo = (JSONObject) aItem.get(i);
//				// 2020-12-18 => 20201218
//				// reservationInfo.get("depPlandTime").equals("20201218");
//				flight.setDepPlandTime((Long) reservationInfo.get("depPlandTime"));
//				flight.setArrPlandTime((Long) reservationInfo.get("arrPlandTime"));
//				flight.setDepAirportNm((String) reservationInfo.get("depAirportNm"));
//				flight.setArrAirportNm((String) reservationInfo.get("arrAirportNm"));
//				flight.setAirlineNm((String) reservationInfo.get("airlineNm"));
//
//				if ((Long) reservationInfo.get("economyCharge") != null) {
//					flight.setEconomyCharge((Long) reservationInfo.get("economyCharge"));
//				} else {
//					flight.setEconomyCharge(45000L);
//				}
//
//				flight.setPrestigeCharge((Long) reservationInfo.get("prestigeCharge"));
//				flight.setVihicleId((String) reservationInfo.get("vihicleId"));
//				fList.add(flight);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return fList;
//	}
//
//	// 항공권 검색 리스트 조회(왕복)
//	@RequestMapping(value = "reservationDataSearchRound.tpo", method = RequestMethod.GET)
//	public String getFlightScheduleSearch1(Model model, String sDepAirportNm, String sArrAirportNm, String sDepPlandTime,
//			String sArrPlandTime, int adultCount, int childCount, int infantCount) {
//		// 가는편
//		ArrayList<TestFlight> fList1 = searchair(sDepAirportNm, sArrAirportNm, sDepPlandTime);
//		// 오는편
//		ArrayList<TestFlight> fList2 = searchair(sArrAirportNm, sDepAirportNm, sArrPlandTime);
//
//		// 인원수
//		int acCount = adultCount + childCount;
//		int totalCount = adultCount + childCount + infantCount;
//
//		model.addAttribute("fList", fList1);
//		model.addAttribute("fList2", fList2);
//		model.addAttribute("adultCount", adultCount);
//		model.addAttribute("childCount", childCount);
//		model.addAttribute("infantCount", infantCount);
//		model.addAttribute("acCount", acCount);
//		model.addAttribute("tCount", totalCount);
//		return "reservation/reservationSearchView";
//	}
//
//	// 항공권 검색 리스트 조회(편도)
//	@RequestMapping(value = "reservationDataSearchOne.tpo", method = RequestMethod.GET)
//	public String getFlightScheduleSearch2(Model model, String sDepAirportNm, String sArrAirportNm,
//			String sDepPlandTime, int adultCount, int childCount, int infantCount) {
//		
//		// 가는편
//		ArrayList<TestFlight> fList = searchair(sDepAirportNm, sArrAirportNm, sDepPlandTime);
//
//		// 인원수
//		int acCount = adultCount + childCount;
//		int totalCount = adultCount + childCount + infantCount;
//
//		model.addAttribute("fList", fList);
//		model.addAttribute("adultCount", adultCount);
//		model.addAttribute("childCount", childCount);
//		model.addAttribute("infantCount", infantCount);
//		model.addAttribute("acCount", acCount);
//		model.addAttribute("tCount", totalCount);
//		return "reservation/reservationSearchView2";
//	}
//	
//	// 서치뷰페이지에서 값을 받아서 passengerInsertForm에 뿌려주기(왕복)
//	@RequestMapping(value = "passengerFormRound.tpo", method = RequestMethod.GET)
//	public String passengerInsertForm(HttpServletRequest request, Model model) {
//
//		// 가는편
//		String depJourney = request.getParameter("depJourney");
//		String depAirlineNm = request.getParameter("depAirlineNm");
//		String depTime = request.getParameter("depTime");
//		String arrTime = request.getParameter("arrTime");
//		String seatGrade = request.getParameter("seatGrade");
//		String fare = request.getParameter("fare");
//		String people = request.getParameter("people");
//		
//		model.addAttribute("depJourney", depJourney);
//		model.addAttribute("depAirlineNm", depAirlineNm);
//		model.addAttribute("depTime", depTime);
//		model.addAttribute("arrTime", arrTime);
//		model.addAttribute("seatGrade", seatGrade);
//		model.addAttribute("fare", fare);
//		model.addAttribute("people", people);
//		
//		// 오는편
//		String depJourney2 = request.getParameter("depJourney2");
//		String depAirlineNm2 = request.getParameter("depAirlineNm2");
//		String depTime2 = request.getParameter("depTime2");
//		String arrTime2 = request.getParameter("arrTime2");
//		String seatGrade2 = request.getParameter("seatGrade2");
//		String fare2 = request.getParameter("fare2");
//		String people2 = request.getParameter("people2");
//		
//		model.addAttribute("depJourney2", depJourney2);
//		model.addAttribute("depAirlineNm2", depAirlineNm2);
//		model.addAttribute("depTime2", depTime2);
//		model.addAttribute("arrTime2", arrTime2);
//		model.addAttribute("seatGrade2", seatGrade2);
//		model.addAttribute("fare2", fare2);
//		model.addAttribute("people2", people2);
//		
//		/// 인원 수
//		int tCount = Integer.parseInt(request.getParameter("tCount"));
//		int adultCount = Integer.parseInt(request.getParameter("adultCount"));
//		int childCount = Integer.parseInt(request.getParameter("childCount"));
//		int infantCount = Integer.parseInt(request.getParameter("infantCount"));
//		
//		model.addAttribute("tCount", tCount);
//		model.addAttribute("adultCount", adultCount);
//		model.addAttribute("childCount", childCount);
//		model.addAttribute("infantCount", infantCount);
//		
//		return "reservation/passengerInsertForm";
//	}
//
//	// 서치뷰페이지에서 값을 받아서 passengerInsertForm에 뿌려주기(편도)
//	@RequestMapping(value = "passengerFormOne.tpo", method = RequestMethod.GET)
//	public String passengerInsertForm2(HttpServletRequest request, Model model) {
//		
//		String depJourney = request.getParameter("depJourney");
//		String depAirlineNm = request.getParameter("depAirlineNm");
//		String depTime = request.getParameter("depTime");
//		String arrTime = request.getParameter("arrTime");
//		String seatGrade = request.getParameter("seatGrade");
//		String fare = request.getParameter("fare");
//		String people = request.getParameter("people");
//		//System.out.println(depJourney +"/"+ depAirlineNm +"/"+ depTime +"/"+ arrTime +"/"+ seatGrade +"/"+ fare +"/"+ people);
//		
//		model.addAttribute("depJourney", depJourney);
//		model.addAttribute("depAirlineNm", depAirlineNm);
//		model.addAttribute("depTime", depTime);
//		model.addAttribute("arrTime", arrTime);
//		model.addAttribute("seatGrade", seatGrade);
//		model.addAttribute("fare", fare);
//		model.addAttribute("people", people);
//		
//		// 인원 수
//		int tCount = Integer.parseInt(request.getParameter("tCount"));
//		int adultCount = Integer.parseInt(request.getParameter("adultCount"));
//		int childCount = Integer.parseInt(request.getParameter("childCount"));
//		int infantCount = Integer.parseInt(request.getParameter("infantCount"));
//		
//		model.addAttribute("tCount", tCount);
//		model.addAttribute("adultCount", adultCount);
//		model.addAttribute("childCount", childCount);
//		model.addAttribute("infantCount", infantCount);
//		
//		return "reservation/passengerInsertForm2";
//	}
//		
//	// 예약 완료 페이지(왕복)
//	@RequestMapping(value = "multipleInsertRound.tpo", method = RequestMethod.POST)
//	public String insertMulti(HttpServletRequest request, Passenger passenger, int rPeople, String userId, ReservationInfo rInfo, ReservationInfo2 rInfo2, Model model) {
//		
//		Reservation reservation = new Reservation();
//		reservation.setrPeople(rPeople);
//		reservation.setUserId(userId);
//		
//		int result = rService.insertPassenger(passenger);
//		int result2 = rService.insertReservation(reservation);
//		int result3 = rService.insertRInfo(rInfo);
//		int result4 = rService.insertRInfo(rInfo2);
//		
//		// 인원 수
//		int tCount = Integer.parseInt(request.getParameter("tCount"));
//		int acCount = Integer.parseInt(request.getParameter("acCount"));
//		int adultCount = Integer.parseInt(request.getParameter("adultCount"));
//		int childCount = Integer.parseInt(request.getParameter("childCount"));
//		int infantCount = Integer.parseInt(request.getParameter("infantCount"));
//		
//		model.addAttribute("tCount", tCount);
//		model.addAttribute("acCount", acCount);
//		model.addAttribute("adultCount", adultCount);
//		model.addAttribute("childCount", childCount);
//		model.addAttribute("infantCount", infantCount);
//				
//		System.out.println(passenger.toString());
//		
//		if (result > 0) {
//			if(result2 > 0) {
//				if(result3 > 0) {
//					if(result4 > 0) {
//						model.addAttribute("reservation", reservation);
//						model.addAttribute("rInfo", rInfo);
//						model.addAttribute("rInfo2", rInfo2);
//						return "reservation/reservationDetailView";						
//					} else {
//						return "reservation/reservationError";
//					}
//				} else {
//					return "reservation/reservationError";
//				}
//			} else {
//				return "reservation/reservationError";
//			}
//		} else {
//			return "reservation/reservationError";
//		}
//	}
//	
//	// 예약 완료 페이지(편도)
//	@RequestMapping(value = "multipleInsertOne.tpo", method = RequestMethod.POST)
//	public String insertMulti2(HttpServletRequest request, Passenger passenger, int rPeople, String userId, ReservationInfo rInfo, Model model) {
//		
//		Reservation reservation = new Reservation();
//		reservation.setrPeople(rPeople);
//		reservation.setUserId(userId);
//		
//		int result = rService.insertPassenger(passenger);
//		int result2 = rService.insertReservation(reservation);
//		int result3 = rService.insertRInfo(rInfo);
//		
//		// 인원 수
//		int tCount = Integer.parseInt(request.getParameter("tCount"));
//		int acCount = Integer.parseInt(request.getParameter("acCount"));
//		int adultCount = Integer.parseInt(request.getParameter("adultCount"));
//		int childCount = Integer.parseInt(request.getParameter("childCount"));
//		int infantCount = Integer.parseInt(request.getParameter("infantCount"));
//		
//		model.addAttribute("tCount", tCount);
//		model.addAttribute("acCount", acCount);
//		model.addAttribute("adultCount", adultCount);
//		model.addAttribute("childCount", childCount);
//		model.addAttribute("infantCount", infantCount);
//		
//		if (result > 0) {
//			if(result2 > 0) {
//				if(result3 > 0) {
//					model.addAttribute("reservation", reservation);
//					model.addAttribute("rInfo", rInfo);
//					return "reservation/reservationDetailView2";
//				} else {
//					return "reservation/reservationError";
//				}
//			} else {
//				return "reservation/reservationError";
//			}
//		} else {
//			return "reservation/reservationError";
//		}
//	}
//}