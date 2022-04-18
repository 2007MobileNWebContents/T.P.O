package com.kh.tpo.main.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tpo.main.domain.City;
import com.kh.tpo.main.domain.Urban;
import com.kh.tpo.rest.domain.Rest;
import com.kh.tpo.rest.domain.RestInfo;
import com.kh.tpo.rest.domain.Room;
import com.kh.tpo.sight.domain.MainSight;
import com.kh.tpo.sight.domain.Sight;

@Repository
public class MainStoreLogic implements MainStore{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertCity(ArrayList<City> cityList) {
		return session.insert("MainMapper.insertCity", cityList);
	}

	@Override
	public int insertUrban(ArrayList<Urban> urbanList) {
		return session.insert("MainMapper.insertUrban", urbanList);
	}

	@Override
	public ArrayList<Urban> selectAllUrban() {
		return (ArrayList)session.selectList("MainMapper.selectAllUrban");
	}

	@Override
	public ArrayList<City> selectCity(HashMap<String,String> map) {
		return (ArrayList)session.selectList("MainMapper.selectCity",map);
	}

	@Override
	public ArrayList<MainSight> selectSightList() {
		return (ArrayList)session.selectList("sightMapper.selectSightList");
	}

	@Override
	public int checkDate(String currentDate) {
		return session.selectOne("MainMapper.checkDate", currentDate);
	}

	@Override
	public ArrayList<Rest> selectRestList() {
		return (ArrayList)session.selectList("RestMapper.selectAllRest");
	}

	@Override
	public ArrayList<Room> selectRoomList() {
		return (ArrayList)session.selectList("RestMapper.selectAllRoom");
	}

}
