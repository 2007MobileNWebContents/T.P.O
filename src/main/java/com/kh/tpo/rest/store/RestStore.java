package com.kh.tpo.rest.store;

import java.util.ArrayList;
import java.util.List;

import com.kh.tpo.rest.domain.PageInfo;
import com.kh.tpo.rest.domain.Rest;
import com.kh.tpo.rest.domain.RestInfo;
import com.kh.tpo.rest.domain.Room;
import com.kh.tpo.rest.domain.Search;

public interface RestStore {
	
	public int insertRest(ArrayList<Rest> list);
	public int insertRoom(ArrayList<Room> rooms);
	public ArrayList<Rest> restSearchList(PageInfo page);
	public Rest restSearchOne(Rest rest);
	public ArrayList<RestInfo> roomSearchList(int reNo);
	public int getListCount();
	public int getSearchCount(Search search);
	public Room roomInfo(int rNo);
	public int addReadCount(int reNo);
	public ArrayList<Rest> SearchrName(Search search, PageInfo page);
	public ArrayList<RestInfo> searchPrice(Search search,PageInfo page );
	public ArrayList<RestInfo> alignList(Search search,  PageInfo page);
//	public ArrayList<RestInfo> searchLocal(Search search, PageInfo page);
	public ArrayList<RestInfo> searchAllList(Search search,  PageInfo page);
	public ArrayList<RestInfo> priceRowSearch(Search search);

}
