package com.kh.DAYWORK.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DAYWORK.board.model.dao.BoardDAO;
import com.kh.DAYWORK.board.model.vo.Board;
import com.kh.DAYWORK.board.model.vo.Reply;
import com.kh.DAYWORK.common.BMsgFile;

@Service("bService")
public class BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;

	public int getListCount() {
		return bDAO.getListCount(sqlSession);
	}

	public ArrayList<Board> selectBList(HashMap<String, String> map) {
		return bDAO.selectBList(sqlSession, map);
	}

	public int insertBoard(Board b, ArrayList<BMsgFile> fileList) {
		
		int result1 = bDAO.insertBoard(sqlSession, b);
		int result2 = 0;
		if(result1 > 0) {
			int bNo = bDAO.selectBNo(sqlSession);
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setfBNo(bNo);
			}
			result2 = bDAO.insertFile(sqlSession, fileList);
		}
		
		return result1 + result2;
	}

	public Board selectBoard(int bNo, boolean check) {
		
		Board b = null;
		if(check) {
			int result = bDAO.plusCount(sqlSession, bNo);
			if(result > 0) {
				b = bDAO.selectBoard(sqlSession, bNo);
			}
		} else {
			b = bDAO.selectBoard(sqlSession, bNo);
		}
		
		return b;
	}

	public ArrayList<BMsgFile> selectFile(int bNo) {
		return bDAO.selectFile(sqlSession, bNo);
	}

	public int updateBoard(Board b, ArrayList<BMsgFile> fileList, String[] beforeFile) {
		
		int result1 = bDAO.updateBoard(sqlSession, b);
		int result2 = 0;
		int result3 = 0;
		if(result1 > 0) {
			if(beforeFile != null) {
				result2 = bDAO.deleteFile(sqlSession, beforeFile);				
			}
			result3 = bDAO.insertFile(sqlSession, fileList);
		}
		
		return result1 + result2 + result3;
	}

	public void deleteFile(String[] deleteFiles) {
		bDAO.deleteFile(sqlSession, deleteFiles);
	}

	public int searchBListCount(HashMap<String, String> map) {
		return bDAO.searchBListCount(sqlSession, map);
	}

	public ArrayList<Board> searchBList(HashMap<String, String> map) {
		return bDAO.serachBList(sqlSession, map);
	}

	public int deleteBoard(int bNo) {
		int result = bDAO.deleteBoard(sqlSession, bNo);
		
		if(result > 0) {
			result = bDAO.deleteFileBNo(sqlSession, bNo);
		}
		return result;
	}

	public ArrayList<Reply> insertReply(Reply reply) {
		
		int result = bDAO.insertReply(sqlSession, reply);
		ArrayList<Reply> r = null;
		
		if(result > 0) {
			int result2 = bDAO.updateCountReply(sqlSession, reply);
			if(result2 > 0) {
				r = selectRList(reply.getrBNo());				
			}
		}
		
		return r;
	}
	
	public ArrayList<Reply> selectRList(int bNo) {
		return bDAO.selectRList(sqlSession, bNo);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
}
