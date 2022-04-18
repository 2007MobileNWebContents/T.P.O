package com.kh.tpo.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tpo.main.domain.City;
import com.kh.tpo.main.domain.Urban;
import com.kh.tpo.main.store.MainStore;
import com.kh.tpo.rest.domain.Rest;
import com.kh.tpo.rest.domain.RestInfo;
import com.kh.tpo.rest.domain.Room;
import com.kh.tpo.sight.domain.MainSight;
import com.kh.tpo.sight.domain.Sight;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainStore mainStore;
	@Override
	public int insertCity(ArrayList<City> cityList) {
		return mainStore.insertCity(cityList);
	}
	@Override
	public int insertUrban(ArrayList<Urban> urbanList) {
		return mainStore.insertUrban(urbanList);
	}
	@Override
	public ArrayList<Urban> selectAllUrban() {
		return mainStore.selectAllUrban();
	}
	@Override
	public ArrayList<City> selectCity(HashMap<String,String> map) {
		return mainStore.selectCity(map);
	}
	@Override
	public ArrayList<MainSight> selectSightList() {
		return mainStore.selectSightList();
	}
	@Override
	public int checkDate(String currentDate) {
		return mainStore.checkDate(currentDate);
	}
	@Override
	public ArrayList<Rest> selectRestList() {
		return mainStore.selectRestList();
	}
	@Override
	public ArrayList<Room> selectRoomList() {
		return mainStore.selectRoomList();
	}

}
