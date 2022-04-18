package com.kh.tpo.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tpo.main.domain.City;
import com.kh.tpo.main.domain.Urban;
import com.kh.tpo.rest.domain.Rest;
import com.kh.tpo.rest.domain.RestInfo;
import com.kh.tpo.rest.domain.Room;
import com.kh.tpo.sight.domain.MainSight;
import com.kh.tpo.sight.domain.Sight;

public interface MainService {
	/*
	 * 전국 시도별 확진자 수 insert
	 * @param ArrayList<Urban>
	 * @result int
	 * */
	public int insertUrban(ArrayList<Urban> urbanList);
	/*
	 * 전국 시도별 확진자 수 select
	 * @param ArrayList<Urban>
	 * @result ArrayList<Urban>
	 * */
	public ArrayList<Urban> selectAllUrban();
	/*
	 * 서울 코로나 확진자 수 insert
	 * @param ArrayList<City>
	 * @result int
	 * */
	public int insertCity(ArrayList<City> cityList);
	/*
	 * 해당 지역 확진자 수 select
	 * @param HashMap<String,String>
	 * @result ArrayList<Urban>
	 * */
	public ArrayList<City> selectCity(HashMap<String,String> map);
	/*
	 * 숙소 리스트 select
	 * @param 
	 * @result ArrayList<Rest>
	 * */
	public ArrayList<Rest> selectRestList();
	/*
	 * 객소 리스트 select
	 * @param 
	 * @result ArrayList<Rest>
	 * */
	public ArrayList<Room> selectRoomList();
	/*
	 * 메인 명소 리스트 select
	 * @param 
	 * @result ArrayList<Rest>
	 * */
	public ArrayList<MainSight> selectSightList();
	/*
	 * 날짜 체크(현재날짜로 데이터가 들어가있는지)
	 * @param String
	 * @result int
	 * */
	public int checkDate(String currentDate);
}
