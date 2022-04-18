package com.kh.tpo.sight.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tpo.sight.domain.PageInfo;
import com.kh.tpo.sight.domain.Sight;
import com.kh.tpo.sight.domain.SightReply;
import com.kh.tpo.sight.domain.SightReview;

public interface SightStore {

	public int insertSight(Sight sight);
	public int insertSightList(Sight sightList);
	public ArrayList<Sight> selectSightList(PageInfo pi);
	public ArrayList<Sight> searchSight();
	public int insertReview(SightReview review);
	public int inserReply(SightReply reply);
	public Sight selectSight(int sNo);
	/*
	 * DB에 저장된 명소리스트 갯수
	 * 
	 * @param 
	 * @return int
	 * */
	public int getListCount();
	public ArrayList<Sight> sightChkList(PageInfo pi,HashMap<String,Object> chkValue);
	public int sightChkCount(HashMap<String,Object> chkValue);
	/* review */
	public ArrayList<SightReview> selectReviewList(int sNo);
	public SightReview selectReview(int reviewNo);
	public int deleteReview(int reviewNo);
	public int modifyReview(SightReview review);
}
