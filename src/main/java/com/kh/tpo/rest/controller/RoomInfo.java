package com.kh.tpo.rest.controller;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.kh.tpo.rest.domain.API1;
import com.kh.tpo.rest.domain.Room;

public class RoomInfo {

	public static ArrayList<Room> roomAPI() throws IOException {
		API1 info = null;
		String serviceKey =  "MTxIOXhjWedk7aVhlZwyFcY1Zc%2FwHL%2FAw71ocx%2FHUZ2OSILURHBaoxNHvG0ZgqP9kChQY1IwTrRgl7CBfUGyOg%3D%3D";
		ArrayList<API1> rlist = new ArrayList<API1>();
		String totalCount = null;
		int check = 0;
		String b = "39";
		String page = "5";
		String currentPage = "1";
		int startV = 132;
		// url 토탈 값 가져오기
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"); /*URL*/
		urlBuilder.append( "?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(currentPage, "UTF-8")); /*현재 페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /*(A=제목순,B=조회순,C=수정순,D=생성일순) 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
		urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("N", "UTF-8")); /*목록구분(Y=목록,N=개수)*/
		urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(b, "UTF-8")); /*지역코드*/
		urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시군구코드(areaCode 필수)*/
		urlBuilder.append("&" + URLEncoder.encode("hanOk","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*한옥 여부*/
		urlBuilder.append("&" + URLEncoder.encode("benikia","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*베니키아 여부*/
		urlBuilder.append("&" + URLEncoder.encode("goodStay","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*굿스테이 여부*/
		urlBuilder.append("&" + URLEncoder.encode("modifiedtime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 수정일*/
		URL url = new URL(urlBuilder.toString());
		// url 연결 
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		//	System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();

		conn.disconnect();

		//ArrayList<Rest> rlist = new ArrayList<Rest>();

		Room room = null;
		ArrayList<Room> oList = new ArrayList<Room>();
		try {
			// sqlSession과 같은 코드
			// Factory를 만들고 생성된 Factory를 통해 DocumentBuilder를 만들어야 함
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();

			// 파일 만드는 위치
			FileOutputStream output = new FileOutputStream("./REST");
			output.write(sb.toString().getBytes());
			output.close();

			//	System.out.println(sb.toString());

			// XML문서 파싱
			Document doc = dBuilder.parse("./REST");
			// 파싱된 XML문서를 정규화 작업
			doc.getDocumentElement().normalize();
			org.w3c.dom.Node totalCnt = null;
			Element item = (Element)doc.getElementsByTagName("item").item(0);

			totalCnt =  item.getElementsByTagName("totalCnt").item(0);
			//	System.out.println(totalCnt.getNodeName() + " : " + totalCnt.getChildNodes().item(0).getNodeValue());
			totalCount = totalCnt.getFirstChild().getNodeValue();
			//	System.out.println(totalCount);						
		}catch(Exception e) {
			e.printStackTrace(); 
		}
		check = Integer.parseInt(totalCount);
		String conList[] = new String[check];
		// 숙소정보 가져오기(숙소정보api)
		urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(currentPage, "UTF-8")); /*현재 페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /*(A=제목순,B=조회순,C=수정순,D=생성일순) 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
		urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*목록구분(Y=목록,N=개수)*/
		urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(b, "UTF-8")); /*지역코드*/
		urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시군구코드(areaCode 필수)*/
		urlBuilder.append("&" + URLEncoder.encode("hanOk","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*한옥 여부*/
		urlBuilder.append("&" + URLEncoder.encode("benikia","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*베니키아 여부*/
		urlBuilder.append("&" + URLEncoder.encode("goodStay","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*굿스테이 여부*/
		urlBuilder.append("&" + URLEncoder.encode("modifiedtime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 수정일*/
		url = new URL(urlBuilder.toString());
		// url 연결 
		conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		//	System.out.println("Response code: " + conn.getResponseCode());
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		sb = new StringBuilder();
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();

		conn.disconnect();

		try {
			// sqlSession과 같은 코드
			// Factory를 만들고 생성된 Factory를 통해 DocumentBuilder를 만들어야 함
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();

			// 파일 만드는 위치
			FileOutputStream output = new FileOutputStream("./REST");
			output.write(sb.toString().getBytes());
			output.close();

			//	System.out.println(sb.toString());

			// XML문서 파싱
			Document doc = dBuilder.parse("./REST");
			// 파싱된 XML문서를 정규화 작업
			doc.getDocumentElement().normalize();
			org.w3c.dom.Node contentId = null;
			org.w3c.dom.Node reName = null;
			org.w3c.dom.Node addr1 = null;
			org.w3c.dom.Node addr2 = null;
			org.w3c.dom.Node firstImage = null;
			org.w3c.dom.Node tel = null;
			org.w3c.dom.NodeList tList = doc.getElementsByTagName("title");

			for(int i=0; i<tList.getLength(); i++ ) {
			//	System.out.println("tList :"  + tList.getLength());
				info = new API1();
				Element item = (Element)doc.getElementsByTagName("item").item(i);

				contentId =  item.getElementsByTagName("contentid").item(0);

				//		System.out.println(contentId.getNodeName() + " : " + contentId.getChildNodes().item(0).getNodeValue());
				String conId = contentId.getChildNodes().item(0).getNodeValue();
				conList[i] = conId;
				//		System.out.println(conList[i]);
				reName  = item.getElementsByTagName("title").item(0);
				//	System.out.println(reName.getNodeName() + " : " + reName.getChildNodes().item(0).getNodeValue());
				String title = reName.getFirstChild().getNodeValue();
				info.setReName(title);

				//						addr1 = item.getElementsByTagName("addr1").item(0);
				//						if(addr1 != null) {
				//						String adress = addr1.getFirstChild().getNodeValue();
				//						rest.setReAddr(adress);
				//						System.out.println(addr1.getNodeName() + " : " + addr1.getChildNodes().item(0).getNodeValue());
				//						}else {
				//							addr1 = null;
				//						}
				addr1 = item.getElementsByTagName("addr1").item(0);
				addr2 = item.getElementsByTagName("addr2").item(0);
				if(addr1 != null && addr2 != null) {
					//		System.out.println(addr2.getNodeName() + " : " + addr2.getChildNodes().item(0).getNodeValue());
					String totalAddr = (addr1.getFirstChild().getNodeValue()) + ((addr2.getFirstChild().getNodeValue()));
					//		System.out.println("1+2"+totalAddr);
					info.setReAddr(totalAddr);
					//		System.out.println("totalAddr : " + totalAddr);
				}else if(addr1 != null && addr2 == null) {
					addr2 = null;
					String totalAddr = addr1.getFirstChild().getNodeValue();
					//		System.out.println("1"+totalAddr);
					info.setReAddr(totalAddr);	
				}else {
					addr1 = null;
					addr2= null;

				}
				String reImage = null;
				firstImage = item.getElementsByTagName("firstimage").item(0);
				if(firstImage != null) {
					//	System.out.println(firstImage.getNodeName() + " : " + firstImage.getChildNodes().item(0).getNodeValue());
					reImage = firstImage.getFirstChild().getNodeValue();
					info.setReImage(reImage);
				}else {
					reImage = "없음";
					info.setReImage(reImage);
				}			
				tel = item.getElementsByTagName("tel").item(0);	
				String rePhone = null;
				if(tel != null) {
					//		System.out.println(tel.getNodeName() + " : " + tel.getChildNodes().item(0).getNodeValue());
					rePhone = tel.getFirstChild().getNodeValue();
					info.setRePhone(rePhone);
				}else {
					rePhone = "준비중"; 
					info.setRePhone(rePhone);
				}
				rlist.add(info);
			}

			//		System.out.println("rlist : " + rlist.size());
			//		System.out.println("숙소정보" + rlist.toString());		
		}catch(Exception e) {
			e.printStackTrace(); 
		}


		// 반복정보조회
		for(int t = 0; t<Integer.parseInt(page); t++) {
		//	System.out.println("page :" + page);
		//	System.out.println("t는 몇번 돌까?" + t);
		//	System.out.println("처음 t 돌때 : " + t);
			urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("Servicekey","UTF-8") + "=" + URLEncoder.encode(serviceKey, "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
			for(int i=0; i<10; i++) {
				urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(conList[t], "UTF-8")); /*콘텐츠 ID*/
				//System.out.println(conList[i]);
			}
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("32", "UTF-8")); /*관광타입(관광지, 숙박 등)ID*/
			url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
		//	System.out.println("Response code: " + conn.getResponseCode());
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			sb = new StringBuilder();
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			//      System.out.println(sb.toString());

			room = null;
			try {
				// sqlSession과 같은 코드
				// Factory를 만들고 생성된 Factory를 통해 DocumentBuilder를 만들어야 함
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();

				// 파일 만드는 위치
				FileOutputStream output = new FileOutputStream("./REST");
				output.write(sb.toString().getBytes());
				output.close();

				//	System.out.println(sb.toString());

				// XML문서 파싱
				Document doc = dBuilder.parse("./REST");
				// 파싱된 XML문서를 정규화 작업
				doc.getDocumentElement().normalize();
				org.w3c.dom.Node roomTitle = null; // RONAME(객실이름)
				org.w3c.dom.Node roomSize1 = null; // ROSIZE (객실크기)
				org.w3c.dom.Node roomCount = null; // ROCOUNT(객실수)
				org.w3c.dom.Node roomBaseCount = null; // PLIMIT(기준인원)
				org.w3c.dom.Node roomMaxCount = null; // PMAXCOUNT(최대인원)
				org.w3c.dom.Node roomOffSeasonMinFee1 = null; // ROPRICE(객실금액)
				org.w3c.dom.Node roomIntro = null; // ROINFO 객실소개			

				//ROFACILITY  객실시설 부분
				org.w3c.dom.Node roomBath = null; // 욕조 여부
				org.w3c.dom.Node roomAirCondition = null; //에어컨 여부
				org.w3c.dom.Node roomTv = null; // TV 여부
				org.w3c.dom.Node roomInternet = null; // 인터넷 여부
				org.w3c.dom.Node roomRefrigerator = null; // 냉장고 여부
				org.w3c.dom.Node roomToiletries = null; // 세면도구 여부
				org.w3c.dom.Node roomCook = null; // 취사용품 여부
				org.w3c.dom.Node roomHairdryer = null; // 드라이기 여부

				// 객실이미지부분
				org.w3c.dom.Node roomImg1 = null; // 객실사진1
				org.w3c.dom.Node roomImg2 = null; // 객실사진2
				org.w3c.dom.Node roomImg3 = null; // 객실사진3
				org.w3c.dom.Node roomImg4 = null; // 객실사진4

				org.w3c.dom.NodeList con = doc.getElementsByTagName("contentid"); // 전체 숙소의 내용 받아오는 리스트
				org.w3c.dom.NodeList num = doc.getElementsByTagName("numOfRows");
				//	System.out.println(con.toString());
				//	System.out.println(roomList.getLength());
				System.out.println("t : " + t);
				for(int i=0; i<con.getLength(); i++ ) {		
				//	System.out.println("i : " + i);
					for(int p=0; p<num.getLength(); p++ ) {
				//	System.out.println("p : " + p);
						room = new Room();
						Element item = (Element)doc.getElementsByTagName("item").item(i);	

						roomTitle  = item.getElementsByTagName("roomtitle").item(0);
						//						System.out.println(accomcountlodging.getNodeName() + " : " + accomcountlodging.getChildNodes().item(0).getNodeValue());


						String roName = roomTitle.getFirstChild().getNodeValue();
						//	System.out.println("객실이름 : " + roName);
						room.setRoName(roName);


						roomSize1 = item.getElementsByTagName("roomsize1").item(0);
						String roSize = roomSize1.getFirstChild().getNodeValue();
						//	System.out.println("roomSize : " + roSize);
						room.setRoSize(roSize);

						roomCount = item.getElementsByTagName("roomcount").item(0);
						int roCount = Integer.parseInt(roomCount.getFirstChild().getNodeValue());
						//	System.out.println("roomCount : " + roCount);
						room.setRoCount(roCount);

						roomMaxCount = item.getElementsByTagName("roommaxcount").item(0);
						int pMaxCount = Integer.parseInt(roomMaxCount.getFirstChild().getNodeValue());
						//	System.out.println("roomMaxCount : " + pMaxCount);
						room.setpMaxCount(pMaxCount);

						roomBaseCount = item.getElementsByTagName("roombasecount").item(0);
						int pLimit = Integer.parseInt(roomBaseCount.getFirstChild().getNodeValue());
						//System.out.println("roomBaseCount : " + pLimit);
						room.setpLimit(pLimit);

						roomOffSeasonMinFee1 = item.getElementsByTagName("roomoffseasonminfee1").item(0);
						int RoPrice = Integer.parseInt(roomOffSeasonMinFee1.getFirstChild().getNodeValue());
						//		System.out.println("roomOffSeasonMinFee1 : " + RoPrice);
						room.setRoPrice(RoPrice);

						String roInfo = null;
						roomIntro = item.getElementsByTagName("roomintro").item(0);
						if(roomIntro != null) {
							roInfo = roomIntro.getFirstChild().getNodeValue();
							//System.out.println("roomIntro : " + roInfo);
						}else {
							roInfo = "없음";
						}
						room.setRoInfo(roInfo);					

						// 객실부분
						String facility1 = null;
						String facility2 = null;
						String facility3 = null;
						String facility4 = null;
						String facility5 = null;
						String facility6 = null;
						String facility7 = null;
						String facility8 = null;
						
				//		System.out.println(t + "번째 item에는 무슨 갑이 있을까? " + roName);
						int reNo = 0;
						
				//		System.out.println("startV : " + startV);
						if(roName == null) {
							reNo = startV+t;
				//			System.out.println("item이 널일 경우 : " + reNo);
						}else {
							reNo =  startV+t;
				//			System.out.println("item이 널이 아닐 경우 : " + reNo);
							room.setReNo(reNo);
						}
						
						
			//			System.out.println("reNo : " + reNo);
						System.out.println("reNo : " + reNo);


						roomBath = item.getElementsByTagName("roombath").item(0);								
						if(roomBath != null) {					
							facility1 = roomBath.getFirstChild().getNodeValue();		
							//		System.out.println("roomBath : " + facility1);
						}else {
							facility1 = "없음";
						}

						roomAirCondition = item.getElementsByTagName("roomaircondition").item(0);												
						if(roomAirCondition != null) {			
							facility2 = roomAirCondition.getFirstChild().getNodeValue();		
							//			System.out.println("roomAirCondition : " + facility2);
						}else {
							facility2 = "없음";
						}


						roomTv = item.getElementsByTagName("roomtv").item(0);									
						if(roomTv != null) {					
							facility3 = roomTv.getFirstChild().getNodeValue();	
							//			System.out.println("roomTv : " + facility3);
						}else {
							facility3 = "없음";
						}

						roomInternet = item.getElementsByTagName("roominternet").item(0);												
						if(roomInternet != null) {					
							facility4 = roomInternet.getFirstChild().getNodeValue();	
							//			System.out.println("roomInternet : " + facility4);
						}else {
							facility4 = "없음";
						}

						roomRefrigerator = item.getElementsByTagName("roomrefrigerator").item(0);									
						if(roomRefrigerator != null) {					
							facility5 = roomRefrigerator.getFirstChild().getNodeValue();	
							//		System.out.println("roomRefrigerator : " + facility5);
						}else {
							facility5 = "없음";
						}

						roomToiletries = item.getElementsByTagName("roomtoiletries").item(0);									
						if(roomToiletries != null) {					
							facility6 = roomToiletries.getFirstChild().getNodeValue();	
							//		System.out.println("roomToiletries : " + facility6);
						}else {
							facility6 = "없음";
						}

						roomCook = item.getElementsByTagName("roomcook").item(0);									
						if(roomCook != null) {		
							facility7 = roomCook.getFirstChild().getNodeValue();	
							//		System.out.println("roomCook : " + facility7);
						}else {
							facility7 = "없음";
						}

						roomHairdryer = item.getElementsByTagName("roomhairdryer").item(0);					

						if(roomHairdryer != null) {			
							facility8 = roomHairdryer.getFirstChild().getNodeValue();	
							//		System.out.println("roomHairdryer : " + facility8);
							room.setRoFacility(facility1 + "," + facility2 + "," + facility3 + "," + facility4 + ","+ facility5 + "," +facility6 + "," +facility7 + "," +facility8);
						}else {
							facility8 = "없음";
							room.setRoFacility(facility1 + "," + facility2 + "," + facility3 + "," + facility4 + ","+ facility5 + "," +facility6 + "," +facility7 + "," +facility8);
						}


						// 객실이미지부분
						String rooms1 = null;
						String rooms2 = null;
						String rooms3 = null;
						String rooms4 = null;
						roomImg1 = item.getElementsByTagName("roomimg1").item(0);													
						if(roomImg1 != null) {	
							rooms1 = roomImg1.getFirstChild().getNodeValue();	
							//			System.out.println(roomImg1.getNodeName() + " : " + roomImg1.getChildNodes().item(0).getNodeValue());
							//			System.out.println("roomimg1 : " + rooms1);
						}else {
							rooms1 = "없음";
						}

						roomImg2 = item.getElementsByTagName("roomimg2").item(0);									
						if(roomImg2 != null) {	
							rooms2 = roomImg2.getFirstChild().getNodeValue();	
							//			System.out.println("roomImg2 : " + rooms2);
						}else {
							rooms2 = "없음";
						}

						roomImg3 = item.getElementsByTagName("roomimg3").item(0);														
						if(roomImg3 != null) {
							rooms3 = roomImg3.getFirstChild().getNodeValue();	
							//			System.out.println(roomImg3.getNodeName() + " : " + roomImg3.getChildNodes().item(0).getNodeValue());
							//			System.out.println("roomimg3 : " + rooms3);
						}else {
							rooms3 = "없음";
						}

						roomImg4 = item.getElementsByTagName("roomimg4").item(0);									
						if(roomImg4 != null) {					
							rooms4 = roomImg4.getFirstChild().getNodeValue();	
							//			System.out.println(roomImg4.getNodeName() + " : " + roomImg4.getChildNodes().item(0).getNodeValue());
							//			System.out.println("roomimg4 : " + rooms4);
							room.setRoImage(rooms1 + "," + rooms2 + "," + rooms3 + "," + rooms4);
						}else {
							rooms4 = "없음";
							room.setRoImage(rooms1 + "," + rooms2 + "," + rooms3 + "," + rooms4);
						}
						oList.add(room);
					//	System.out.println("객실정보 : " + oList.toString());	
					}


					//System.out.println("체크 oList : " + oList.toString());

				}
					
			}catch(Exception e) {
				e.printStackTrace(); 
			}
		}
		
		return oList;

	}		


	public static void main(String[] args) {
		try {
			RoomInfo.roomAPI();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
