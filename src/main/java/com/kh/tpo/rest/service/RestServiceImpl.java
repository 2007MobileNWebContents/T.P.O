package com.kh.tpo.rest.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tpo.rest.domain.PageInfo;
import com.kh.tpo.rest.domain.Rest;
import com.kh.tpo.rest.domain.RestInfo;
import com.kh.tpo.rest.domain.Room;
import com.kh.tpo.rest.domain.Search;
import com.kh.tpo.rest.store.RestStore;

@Service
public class RestServiceImpl implements RestService{

	@Autowired
	private RestStore reStore;

	public int insertRest(ArrayList<Rest> list) {
		int result = 0;
			System.out.println("reService : " + list.toString());
			result = reStore.insertRest(list);
			System.out.println(result);
		return result;
	}

	@Override
	public ArrayList<Rest> restSearchList(PageInfo page) {
		// TODO Auto-generated method stub
		return reStore.restSearchList(page);
	}
	
	// 페이징처리
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return reStore.getListCount();
	}
	
	@Override
	public int getSearchCount(Search search) {
		// TODO Auto-generated method stub
		return reStore.getSearchCount(search);
	}
	
	
	@Override
	public Rest restSearchOne(Rest rest) {
		// TODO Auto-generated method stub
		return reStore.restSearchOne(rest);
	}

	@Override
	public int insertRoom(ArrayList<Room> list) {
		// TODO Auto-generated method stub
		return reStore.insertRoom(list);
	}

	@Override
	public ArrayList<RestInfo> roomSearchList(int reNo) {
		// TODO Auto-generated method stub
		return reStore.roomSearchList(reNo);
	} 


	@Override
	public Room roomInfo(int rNo) {
		// TODO Auto-generated method stub
		return reStore.roomInfo(rNo);
	}

	// 조회
	@Override
	public int addReadCount(int reNo) {
		// TODO Auto-generated method stub
		return reStore.addReadCount(reNo);
	}

	// 숙소명
	@Override
	public ArrayList<Rest> SearchrName(Search search, PageInfo page){
		// TODO Auto-generated method stub
		return reStore.SearchrName(search, page);
	}

	// 정렬
	@Override
	public ArrayList<RestInfo> alignList(Search search,  PageInfo page) {
		// TODO Auto-generated method stub
		return reStore.alignList(search, page);
	}

	// 지역조회
	/*
	 * @Override public ArrayList<RestInfo> searchLocal(Search search, PageInfo
	 * page) { // TODO Auto-generated method stub return reStore.searchLocal(search,
	 * page); }
	 */
	
	@Override
	public ArrayList<RestInfo> searchAllList(Search search, PageInfo page) {
		// TODO Auto-generated method stub
		return reStore.searchAllList(search, page);
	}
	
	// 가격조회
	@Override
	public ArrayList<RestInfo> searchPrice(Search search, PageInfo page) {
		ArrayList<RestInfo> result = reStore.searchPrice(search, page);
	//	System.out.println("rService: " + result);
		return result;
	}

	@Override
	public ArrayList<RestInfo> priceRowSearch(Search search) {
		// TODO Auto-generated method stub
		return reStore.priceRowSearch(search);
	}



	


}
