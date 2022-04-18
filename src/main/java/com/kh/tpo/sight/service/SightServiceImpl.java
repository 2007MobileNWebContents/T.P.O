package com.kh.tpo.sight.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tpo.sight.domain.PageInfo;
import com.kh.tpo.sight.domain.Sight;
import com.kh.tpo.sight.domain.SightReply;
import com.kh.tpo.sight.domain.SightReview;
import com.kh.tpo.sight.store.SightStore;

@Service
public class SightServiceImpl implements SightService{

	@Autowired
	private SightStore sStore;
	
	@Override
	public int insertSight(Sight sight) {
		return 0;
	}

	@Override
	public int insertSightList(Sight sightList) {
		return sStore.insertSightList(sightList);
	}

	@Override
	public ArrayList<Sight> searchSight() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(SightReply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Sight> selectSightList(PageInfo pi) {
		
		return sStore.selectSightList(pi);
	}

	@Override
	public Sight selectSight(int sNo) {
		return sStore.selectSight(sNo);
	}

	@Override
	public int insertReview(SightReview review) {
		return sStore.insertReview(review);
	}

	@Override
	public int getListCount() {
		return sStore.getListCount();
	}

	@Override
	public ArrayList<SightReview> selectReviewList(int sNo) {
		return sStore.selectReviewList(sNo);
	}
	
	@Override
	public SightReview selectReview(int reviewNo) {
		return sStore.selectReview(reviewNo);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return sStore.deleteReview(reviewNo);
	}

	@Override
	public ArrayList<Sight> sightChkList(PageInfo pi, HashMap<String, Object> chkValue) {
		return sStore.sightChkList(pi, chkValue);
	}

	@Override
	public int sightChkCount(HashMap<String,Object> chkValue) {
		return sStore.sightChkCount(chkValue);
	}
	@Override
	public int modifyReview(SightReview review) {
		return sStore.modifyReview(review);
	}


}
