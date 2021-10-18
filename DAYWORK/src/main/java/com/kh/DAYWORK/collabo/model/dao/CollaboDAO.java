package com.kh.DAYWORK.collabo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DAYWORK.board.model.vo.Board;
import com.kh.DAYWORK.collabo.model.vo.Collabo;
import com.kh.DAYWORK.collabo.model.vo.Feedback;
import com.kh.DAYWORK.member.model.vo.Member;

@Repository("cDAO")
public class CollaboDAO {

	public int insertCollaboB(SqlSessionTemplate sqlSession, Board bo) {
		return sqlSession.insert("collabo-mapper.insertBoardC", bo);
	}
	
	public int selectBNo(SqlSessionTemplate sqlSession, Board bo) {
		return sqlSession.selectOne("collabo-mapper.selectBNo", bo);
	}

	public int insertCollaboC(SqlSessionTemplate sqlSession, Collabo co) {
		return sqlSession.insert("collabo-mapper.insertCollabo", co);
	}

	public ArrayList<Collabo> selectListC(SqlSessionTemplate sqlSession, String mName) {
		String mName2 = "%"+mName+"%";
		return (ArrayList)sqlSession.selectList("collabo-mapper.selectListC", mName2);
	}

	public int updateBtn(SqlSessionTemplate sqlSession, Collabo co) {
		return sqlSession.update("collabo-mapper.updateBtn", co);
	}

	public void updateCollaboB(SqlSessionTemplate sqlSession, Collabo co) {
		sqlSession.update("collabo-mapper.updateCollaboB", co);
	}

	public void updateCollaboC(SqlSessionTemplate sqlSession, Collabo co) {
		sqlSession.update("collabo-mapper.updateCollaboC", co);
	}

	public ArrayList<Collabo> selectCateCBctNo(SqlSessionTemplate sqlSession, Collabo co) {
		return (ArrayList)sqlSession.selectList("collabo-mapper.selectCateCBctNo", co);
	}

	public ArrayList<Collabo> selectCateCMNo(SqlSessionTemplate sqlSession, Collabo co) {
		return (ArrayList)sqlSession.selectList("collabo-mapper.selectCateCMNo", co);
	}
	
	public int updateFBStatus(SqlSessionTemplate sqlSession, Feedback fb) {
		return sqlSession.update("collabo-mapper.updateFBStatus", fb);
	}

	public int insertFeedback(SqlSessionTemplate sqlSession, Feedback fb) {
		return sqlSession.insert("collabo-mapper.insertFeedback", fb);
	}

	public ArrayList<Feedback> selectFeedback(SqlSessionTemplate sqlSession, int fCNo) {
		ArrayList<Feedback> fList = (ArrayList)sqlSession.selectList("collabo-mapper.selectFeedback", fCNo);
		return fList;
	}

	public Collabo selcetCollabo(SqlSessionTemplate sqlSession, int fCNo) {
		return sqlSession.selectOne("collabo-mapper.selectCollabo", fCNo);
	}

	public ArrayList<Member> selectMemberListC(SqlSessionTemplate sqlSession, String inputString) {
		return (ArrayList)sqlSession.selectList("collabo-mapper.selectMemberListC", inputString);
	}

	public int deleteCollabo(SqlSessionTemplate sqlSession, int cBNo) {
		return sqlSession.update("collabo-mapper.deleteCollabo", cBNo);
	}

	

}
