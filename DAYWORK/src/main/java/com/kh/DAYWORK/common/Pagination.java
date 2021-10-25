package com.kh.DAYWORK.common;

import com.kh.DAYWORK.address.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		if(currentPage < 1) {
			currentPage = 1;
		}

		int pageLimit = 5;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		if(currentPage > maxPage) {
			currentPage = maxPage;
		}
		
		int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		int endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		} 
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

		return pi;
	}
}
