package com.kh.DAYWORK.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DAYWORK.board.model.vo.Board;
import com.kh.DAYWORK.board.model.vo.Reply;
import com.kh.DAYWORK.common.BMsgFile;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("board-mapper.getListCount");
	}

	public ArrayList<Board> selectBList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("board-mapper.selectBList", map);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("board-mapper.insertBoard", b);
	}
	
	public int selectBNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("board-mapper.selectBNo");
	}

	public int insertFile(SqlSessionTemplate sqlSession, ArrayList<BMsgFile> fileList) {
		
		int result = 0;
		for(BMsgFile f : fileList) {
			result += sqlSession.insert("board-mapper.insertFile", f);
		}
		
		return result;
	}

	public int plusCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.insert("board-mapper.plusCount", bNo);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("board-mapper.selectBoard", bNo);
	}

	public ArrayList<BMsgFile> selectFile(SqlSessionTemplate sqlSession, int bNo) {
		return (ArrayList)sqlSession.selectList("board-mapper.selectFile", bNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("board-mapper.updateBoard", b);
	}

	public int deleteFile(SqlSessionTemplate sqlSession, String[] beforeFile) {
		
		int result = 0;
		for(String f : beforeFile) {
			result += sqlSession.delete("board-mapper.deleteFile", f);
		}
		
		return result;
	}

	public int searchBListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("board-mapper.searchBListCount", map);
	}

	public ArrayList<Board> serachBList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("board-mapper.searchBList", map);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("board-mapper.deleteBoard", bNo);
	}

	public int deleteFileBNo(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.delete("board-mapper.deleteFileBNo", bNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.insert("board-mapper.insertReply", reply);
	}

	public ArrayList<Reply> selectRList(SqlSessionTemplate sqlSession, int bNo) {
		return (ArrayList)sqlSession.selectList("board-mapper.selectRList", bNo);
	}

	public int updateCountReply(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.update("board-mapper.updateCountReply", reply);
	}
	
	


}
