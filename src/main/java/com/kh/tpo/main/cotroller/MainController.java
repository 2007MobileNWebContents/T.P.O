package com.kh.tpo.main.cotroller;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
/*import org.springframework.scheduling.annotation.Scheduled;*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.kh.tpo.main.domain.City;
import com.kh.tpo.main.domain.Urban;
import com.kh.tpo.main.service.MainService;
import com.kh.tpo.rest.domain.Rest;
import com.kh.tpo.rest.domain.Room;
import com.kh.tpo.sight.domain.MainSight;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	// 시도별 코로나 확진자 총합 데이터
//	@Scheduled(fixedDelay=1000)
//	@RequestMapping(value="coronaUrban.tpo", method=RequestMethod.GET)
	@Scheduled(cron="0 0 11 * * ?")
	public void insertUrban() throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=3oqwrivhuG7AyjAuZOIGA64eNYdob9QWOGadD8f6NY1IjGJdfcEONPpY3h%2BRlpnxkKEppGYVa6SI8bBWFAFBzw%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
		SimpleDateFormat sysdatedf = new SimpleDateFormat("yyyyMMdd");
		// 현재 날짜
		String registerDate = sysdatedf.format(new Date(System.currentTimeMillis()));
		// 현재 날짜 형식을 바꿈
		String registerDateFormat = registerDate.substring(0,4) + "-" + registerDate.substring(4,6) + "-" +  registerDate.substring(6,8);
		urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(registerDate, "UTF-8")); /*검색할 생성일 범위의 시작*/
		urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(registerDate, "UTF-8")); /*검색할 생성일 범위의 종료*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
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

		Urban urban = null;
		ArrayList<Urban> urbanList = new ArrayList<>();
		String coronaUpdateDay = "";
		// 문서를 읽기위한 Document객체를 만들어야함 (sqlSession만드는거랑 똑같다고 보면됨)
		// Factory를 만들고 생성된 Factory를 통해 DocumentBuilder를 만들어야 함
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();

		// StringBuffer에 저장된 값을 FileOutputStream을 이용해서 파일을 만든다
		FileOutputStream output = new FileOutputStream("./Urban");
		output.write(sb.toString().getBytes());
		output.close();

		// XML문서 파싱
		Document doc = dBuilder.parse("./Urban");
		// 파싱된 XML문서를 정규화 작업
		doc.getDocumentElement().normalize();
		org.w3c.dom.Node gubun = null;
		org.w3c.dom.Node localOccCnt = null;
		org.w3c.dom.Node stdDay = null;
		org.w3c.dom.NodeList gubunList  = doc.getElementsByTagName("gubun");
		//	 	Element body = (Element)doc.getElementsByTagName("body").item(0);
		// body태그 안의 몇 번째 items태그를 가져올건지 작성
		//	 	Element items = (Element)doc.getElementsByTagName("items").item(0);

		for(int i=0; i<gubunList.getLength(); i++) {
			urban = new Urban();
			// 첫번째꺼랑 마지막 합계는 가져오지 말것
			System.out.println(i!=0&&i!=gubunList.getLength()-1);
			if(i!=0&&i!=gubunList.getLength()-1) {
				//	 	System.out.println(urban.getUrbanNo());
				Element item = (Element)doc.getElementsByTagName("item").item(i);
				// 지역값 가져와서 urban에 담음
				gubun = item.getElementsByTagName("gubun").item(0); 
				String urbanName = gubun.getFirstChild().getNodeValue();
				urban.setUrbanName(urbanName);
				//	 	System.out.println(urban.getUrbanName());
				// 확진자 수 가져와서 urban에 담음
				localOccCnt = item.getElementsByTagName("localOccCnt").item(0);
				int uConfirmedNum = Integer.parseInt(localOccCnt.getFirstChild().getNodeValue());
				urban.setuConfirmedNum(uConfirmedNum);
				//	 	System.out.println(urban.getuConfirmedNum());
				// 일자
				stdDay = item.getElementsByTagName("stdDay").item(0);
				String str1 = stdDay.getFirstChild().getNodeValue();
				coronaUpdateDay = str1.substring(0,4) + "-"+ str1.substring(6,8) +"-"+ str1.substring(10,12);
				urban.setuDate(coronaUpdateDay);
				urbanList.add(urban);
			}
		}
////		 테스트용
//			 	for(URBAN urban2:urbanlist) {
//			 		System.out.println(urban2.toString());
//			 	}
// 		insert하기 전에 당일날짜로 업데이트가 되었는지 확인(코로나 확진자 수)
		if(registerDateFormat.equals(coronaUpdateDay)) {
		int result = mainService.insertUrban(urbanList);
		if(result>0) {
			System.out.println("성공");
		}else {
			System.out.println("오류");
		}
		}else {
			System.out.println("api업데이트가 되지 않음");
		}
	}
	
	
	 // 서울 코로나 확진자 데이터 ... 
//	@Scheduled(fixedDelay=1000)
	@Scheduled(cron="0 10 11 * * ?")
	public void insertCity() throws Exception{ 
		URL req = new URL("http://openapi.seoul.go.kr:8088/56586777556b737431303242594c576e/json/Corona19Status/1/1000/");
		HttpURLConnection conn = (HttpURLConnection)req.openConnection();
		Object obj = JSONValue.parse(new InputStreamReader(conn.getInputStream()));
		
		// 웹브라우저 상의 JSON데이터를 JSONObject타입으로 만들어줌
		JSONObject jobj = (JSONObject)obj;

		// 해당 객체에 담긴 key값으로 원하는 데이터를 가져온다.(코로나19상태 키값으로  아래에 있는 key와value를 가져옴)
		JSONObject obj1 = (JSONObject)jobj.get("Corona19Status");
		
		// ROW키값으로 배열을 받아옴 
		JSONArray obj3 = (JSONArray)obj1.get("row");
		
		// 저장변수 선언
		String[] coronaAreaList = new String[obj3.size()];
		ArrayList<City> cityList = new ArrayList<City>();
		City city = new City();
		String coronaUpdateDay = "";
		
		// 매 11시에 업데이트된 데이터가 올라오지 않은 경우 전 날의 데이터를 추출
		// 업데이트 되는 시간에 값이 존재하는지 없는지 체크하려고 생성
		// 데이터 등록일자 받아오는 날짜 타입
		SimpleDateFormat registerdf = new SimpleDateFormat("yyyy-MM-dd");
		// 데이터 등록일자(Corana19_Idate)
		String registerDate = registerdf.format(new Date(System.currentTimeMillis()));
		
		// row라는 키값의 사이즈만큼 돌려서 안에 있는 데이터를 추출해서 합을 더한다..?
		int dobongGuSum = 0;
		int nowonGuSum  = 0;
		int gangbukGuSum = 0;
		int jungrangGuSum = 0;
		int seongbukGuSum = 0;
		int dongdaemoonGuSum = 0;
		int gwangjinGuSum = 0;
		int eunpyeongGuSum = 0;
		int jongroGuSum = 0;
		int seongdongGuSum = 0;
		int seodaemunGuSum = 0;
		int jungGuSum = 0;
		int mapoGuSum = 0;
		int yongsanGuSum = 0;
		int gangdongGuSum = 0;
		int songpaGuSum = 0;
		int gangnamGuSum = 0;
		int seochoGuSum = 0;
		int dongjakGuSum = 0;
		int gwanakGuSum = 0;
		int yeongdeungpoGuSum = 0;
		int geumcheonGuSum = 0;
		int guroGuSum = 0;
		int yangcheonGuSum = 0;
		int gangseoGuSum = 0;
		int OtherNum = 0;
		int etcNum =0;
		// 행정구역 별 확진자 수 
		for(int i=0; i<obj3.size(); i++) {
			// 배열 안에 있는것도 JSON형식이라서 JSON Object로 추출
			JSONObject coronaInfo = (JSONObject)obj3.get(i);
			// api에서 가져온 등록날짜를 공백 단위로 자를거임
			String str1 =  (String)coronaInfo.get("CORONA19_IDATE");
			coronaUpdateDay = "2" + str1.substring(1,10);
//			System.out.println("coronaUpdateDay: " + coronaUpdateDay);
			// 발생 지역
			String area = (String)coronaInfo.get("CORONA19_AREA");
			String coronaArea = "서울"+ " " + area;
//			System.out.println("coronaArea: " + coronaArea);
			// 발생 일자
			// 일자를 int로 바꿔서 하루 빼기
			int intFormat = Integer.parseInt(str1.substring(8,10));
			int resultFormat = intFormat-1;
//			System.out.println(resultFormat);
			String coronaDate = coronaUpdateDay.substring(5,7)+"."+ resultFormat+"."; 
//			System.out.println("corona_date: " + coronaDate);
			// 비교날짜
			String equalDate = (String)coronaInfo.get("CORONA19_DATE");
			// 코로나 발생 지역을 전부를 받아놓음(필터하기위해)
			coronaAreaList[i] = coronaArea;
			
			// spring scheduler이용
			// 현재 날짜로 업데이트가 된 데이터가 존재하면 그 값을 DB에 저장(매 11시마다 업데이트를 할거임)
			// registerDate.equals(coronaUpdateDay)
			if(coronaDate.equals(equalDate)){
				// 각 행정구역별로 확진자 수를 책정ㄴ
				switch(coronaArea) {
					case "서울 도봉구": dobongGuSum +=1; break;
					case "서울 노원구": nowonGuSum +=1; break;
					case "서울 강북구": gangbukGuSum +=1; break;
					case "서울 중랑구": jungrangGuSum +=1; break;
					case "서울 성북구": seongbukGuSum +=1; break;
					case "서울 동대문구": dongdaemoonGuSum +=1; break;
					case "서울 광진구": gwangjinGuSum +=1; break;
					case "서울 은평구": eunpyeongGuSum +=1; break;
					case "서울 종로구": jongroGuSum +=1; break;
					case "서울 성동구": seongdongGuSum +=1; break;
					case "서울 서대문구": seodaemunGuSum +=1; break;
					case "서울 중구": jungGuSum +=1; break;
					case "서울 마포구": mapoGuSum +=1; break;
					case "서울 용산구": yongsanGuSum +=1; break;
					case "서울 강동구": gangdongGuSum +=1; break;
					case "서울 송파구": songpaGuSum +=1; break;
					case "서울 강남구": gangnamGuSum +=1; break;
					case "서울 서초구": seochoGuSum +=1; break;
					case "서울 동작구": dongjakGuSum +=1; break;
					case "서울 관악구": gwanakGuSum +=1; break;
					case "서울 영등포구": yeongdeungpoGuSum +=1; break;
					case "서울 금천구": geumcheonGuSum +=1; break;
					case "서울 구로구": guroGuSum +=1; break;
					case "서울 양천구": yangcheonGuSum +=1; break;
					case "서울 강서구": gangseoGuSum +=1; break;
					case "서울 타시도": OtherNum +=1; break;
					case "서울 기타": etcNum +=1; break;
				}
			}
		}
		// 여기다가 받아놓은 값을 뿌리면서 필터링처리하고 값을 arrayList에 담아놓음
		ArrayList<String> arrayList = new ArrayList<>();
		for(String data: coronaAreaList) {
			if(!arrayList.contains(data)) {
				arrayList.add(data);
			}
		}
		// 필터해서 저장해놓은 지역이름과 날짜를 urban에 저장한 후 List에 추가
		for(int i=0; i<arrayList.size(); i++) {
			city = new City();
			city.setCityName(arrayList.get(i));
			city.setcDate(coronaUpdateDay);
			cityList.add(city);
		}
		// urbanList에 저장된 지역이름 다 꺼내와서 일치되는 거에 합계 넣어줌
		for(int i=0; i<cityList.size(); i++) {
			city = new City();
			switch(cityList.get(i).getCityName()) {
			case "서울 도봉구": city.setcConfirmedNum(dobongGuSum); break;
			case "서울 노원구": city.setcConfirmedNum(nowonGuSum); break;
			case "서울 강북구": city.setcConfirmedNum(gangbukGuSum); break;
			case "서울 중랑구": city.setcConfirmedNum(jungrangGuSum); break;
			case "서울 성북구": city.setcConfirmedNum(seongbukGuSum); break;
			case "서울 동대문구": city.setcConfirmedNum(dongdaemoonGuSum); break;
			case "서울 광진구": city.setcConfirmedNum(gwangjinGuSum); break;
			case "서울 은평구": city.setcConfirmedNum(eunpyeongGuSum); break;
			case "서울 종로구": city.setcConfirmedNum(jongroGuSum); break;
			case "서울 성동구": city.setcConfirmedNum(seongdongGuSum); break;
			case "서울 서대문구": city.setcConfirmedNum(seodaemunGuSum); break;
			case "서울 중구": city.setcConfirmedNum(jungGuSum); break;
			case "서울 마포구": city.setcConfirmedNum(mapoGuSum); break;
			case "서울 용산구": city.setcConfirmedNum(yongsanGuSum); break;
			case "서울 강동구": city.setcConfirmedNum(gangdongGuSum); break;
			case "서울 송파구": city.setcConfirmedNum(songpaGuSum); break;
			case "서울 강남구": city.setcConfirmedNum(gangnamGuSum); break;
			case "서울 서초구": city.setcConfirmedNum(seochoGuSum); break;
			case "서울 동작구": city.setcConfirmedNum(dongjakGuSum); break;
			case "서울 관악구": city.setcConfirmedNum(gwanakGuSum); break;
			case "서울 영등포구": city.setcConfirmedNum(yeongdeungpoGuSum); break;
			case "서울 금천구": city.setcConfirmedNum(geumcheonGuSum); break;
			case "서울 구로구": city.setcConfirmedNum(guroGuSum); break;
			case "서울 양천구": city.setcConfirmedNum(yangcheonGuSum); break;
			case "서울 강서구": city.setcConfirmedNum(gangseoGuSum); break;
			case "서울 타시도": city.setcConfirmedNum(OtherNum); break;
			case "서울 기타": city.setcConfirmedNum(etcNum); break;
			}
			cityList.get(i).setcConfirmedNum((city.getcConfirmedNum()));
		}
		/*
		 * for(int i=0; i<cityList.size(); i++) {
		 * System.out.println(cityList.get(i).toString()); }
		 */
// 		insert하기 전에 당일날짜로 업데이트가 되었는지 확인(코로나 확진자 수)
//		int result = mainService.insertCity(cityList);
//		if(result>0) {
//			System.out.println("성공");
//		}else {
//			System.out.println("오류");
//		}
		System.out.println(registerDate);
		System.out.println(coronaUpdateDay);
		if(registerDate.equals(coronaUpdateDay)) {
		int result = mainService.insertCity(cityList);
		if(result>0) {
			System.out.println("성공");
		}else {
			System.out.println("오류");
		}
		}else {
			System.out.println("api업데이트가 되지 않음");
		}
	}
	
	// 메인페이지 이동(명소, 숙소 데이터를 불러와야 함)
	@RequestMapping(value="mainPage.tpo", method=RequestMethod.GET)
	public String mainPageView(Model model) {
		// 최신순으로 명소, 숙소 리스트를 받아서 넘김
		ArrayList<Rest> restList = mainService.selectRestList();
		ArrayList<Room> roomList = mainService.selectRoomList();
		ArrayList<MainSight> sightList = mainService.selectSightList();
		// 데이터 등록일자 받아오는 날짜 타입
		SimpleDateFormat registerdf = new SimpleDateFormat("yyyy-MM-dd");
		// 데이터 등록일자(현재날짜)
		String currentDate = registerdf.format(new Date(System.currentTimeMillis()));
//		for(MainSight info: sightList) {
//			System.out.println(info.toString());
//		}
//		&& !sightList.isEmpty()
		if(!roomList.isEmpty() && !restList.isEmpty() && !sightList.isEmpty()) {
			model.addAttribute("roomList", roomList);
			model.addAttribute("restList", restList);
			model.addAttribute("sightList", sightList);
			model.addAttribute("currentDate", currentDate);
			return "index";
		}else {
			return "common/errorPage";
		}
	}
	
	// 메인 국내 지도 데이터 가져오는 거
	@ResponseBody
	@RequestMapping(value="urbanMapList.tpo", method=RequestMethod.GET)
	public ArrayList<Urban> mainUrbanMap() {
		/*
		 * SimpleDateFormat registerdf = new SimpleDateFormat("yyyy-MM-dd"); // 오늘날짜를
		 * 파라미터로 넘겨서 가져와야 함 String registerDate = registerdf.format(new
		 * Date(System.currentTimeMillis()));
		 */
		// 일일 시도별 코로나 확진자 데이터
		ArrayList<Urban> urbanList = mainService.selectAllUrban();
		// 일일 행정구역별 코로나 확진자 데이터 (서울)
//		ArrayList<City> seoulList = mainService.selectSeoul();
		if(!urbanList.isEmpty()) {
			return urbanList;
		}else {
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="cityMapList.tpo", method=RequestMethod.GET)
	public ArrayList<City> mainCityMap(String local){
		ArrayList<City> cityList = new ArrayList<City>();
		// 클릭한 값이 없는 경우 서울을 default로 잡음
		if(local.equals("")) {
			local="서울";
		}
		
//		System.out.println(local);
		// 데이터 등록일자 받아오는 날짜 타입
		SimpleDateFormat registerdf = new SimpleDateFormat("yyyy-MM-dd");
		// 데이터 등록일자(현재날짜)
		String currentDate = registerdf.format(new Date(System.currentTimeMillis()));
		// currentDay기준 2일전 날짜 
		String prevDate = currentDate.substring(0,7) + "-" +(Integer.parseInt(currentDate.substring(8,10))-2);
		// 현재날짜가 기준 -1
		String yesterDay = currentDate.substring(0,7) + "-" +(Integer.parseInt(currentDate.substring(8,10))-1);
		// yesterDay를 기준으로 2일 전 날짜
		String beforeDate = yesterDay.substring(0,7) + "-" +(Integer.parseInt(yesterDay.substring(8,10))-2);
		// 지역, 날짜 기준으로 3일 데이터를 불러와야함
		HashMap<String, String> map = new HashMap<String, String>();
//		System.out.println(local.equals("서울") || local.equals("제주특별자치도"));
		if(local.equals("서울")) {
		// 당일 데이터가 있는지 유무
		boolean dataChk = mainService.checkDate(currentDate)==0 ? true : false;
		if(dataChk) {
			// 당일날짜로 업데이트가 없으면 전날을 기준으로 3일데이터를 불러옴
			map.put("local", local);
			map.put("currentDate", yesterDay);
			map.put("prevDate", beforeDate);
			cityList=mainService.selectCity(map);
		}else {
			map.put("local", local);
			map.put("currentDate", currentDate);
			map.put("prevDate", prevDate);
			cityList=mainService.selectCity(map);
		}
//		for(City city : cityList) {
//			System.out.println(city.toString());
//		}
		// 서울, 제주 빼고는 특정날짜를 기준으로 불러옴(api가 없어서 임의의 데이터를 출력)
		}else {
			map.put("local", local);
			map.put("currentDate", "2020-12-17");
			map.put("prevDate", "2020-12-17");
			cityList=mainService.selectCity(map);
//			for(City city : cityList) {
//			System.out.println(city.toString());
//			}
		}
//		for(City city : cityList) {
//		System.out.println(city.toString());
//		}
		if(!cityList.isEmpty() &&cityList!=null) {
			return cityList; 
		}else {
			return null;
		}
	}
	
}
