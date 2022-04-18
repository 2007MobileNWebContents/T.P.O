package com.kh.tpo.sight.common;

import com.kh.tpo.sight.domain.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		// 한 페이지에 보여줄 navigation 수
		int pageLimit = 5;
		// 마지막 navigaiton 
		int maxPage;
		// 현재 페이지에서 시작 게시글
		int startPage;
		// 현재 페이지에서 마지막 게시글
		int endPage;
		// 한 페이지에 보여줄 게시글 갯수
		int boardLimit = 9;
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit+0.9))-1) * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		pi = new PageInfo(currentPage,boardLimit,pageLimit,startPage,endPage,listCount,maxPage);
		return pi;
	}

}
