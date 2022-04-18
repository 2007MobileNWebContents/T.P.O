package com.kh.tpo.sight.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tpo.sight.domain.PageInfo;
import com.kh.tpo.sight.domain.Sight;
import com.kh.tpo.sight.domain.SightReply;
import com.kh.tpo.sight.domain.SightReview;

@Repository
public class SightStoreLogic implements SightStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertSight(Sight sight) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Sight> searchSight() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReview(SightReview review) {
		return sqlSession.insert("sightMapper.insertSightReview",review);
	}



	@Override
	public int inserReply(SightReply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSightList(Sight sightList) {
		return sqlSession.insert("sightMapper.insertSightList", sightList);
	}

	@Override
	public ArrayList<Sight> selectSightList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Sight> sList = (ArrayList)sqlSession.selectList("sightMapper.selectSightList", null, rowBounds);
//		for(SightList list: sList) {
//			System.out.println(list.toString());
//		}

		return sList;
	}

	@Override
	public Sight selectSight(int sNo) {
		return sqlSession.selectOne("sightMapper.selectSight", sNo);
	}


	@Override
	public int getListCount() {
		return sqlSession.selectOne("sightMapper.getListCount");
	}

	@Override
	public ArrayList<SightReview> selectReviewList(int sNo) {
		return (ArrayList)sqlSession.selectList("sightMapper.selectReviewList", sNo);
	}

	@Override
	public SightReview selectReview(int reviewNo) {
		return sqlSession.selectOne("sightMapper.selectReview", reviewNo);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return sqlSession.delete("sightMapper.deleteReview", reviewNo);
	}

	@Override
	public ArrayList<Sight> sightChkList(PageInfo pi, HashMap<String, Object> chkValue) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("sightMapper.selectChkList", chkValue, rowBounds);
	}

	@Override
	public int sightChkCount(HashMap<String,Object> chkValue) {
		return sqlSession.selectOne("sightMapper.getChkCount",chkValue);
	}

	@Override
	public int modifyReview(SightReview review) {
		return sqlSession.update("sightMapper.modifyReview", review);
	}

}