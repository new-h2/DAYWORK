package com.kh.DAYWORK.member.model.vo;
import com.kh.DAYWORK.member.model.vo.MemberPageInfo;

public class MemberPagination {
	
	public static MemberPageInfo getPageInfo(int currentPage, int listCount) {
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 14;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		startPage =  ((currentPage-1)/pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		MemberPageInfo mpi = new MemberPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		return mpi;
		
	}

}

