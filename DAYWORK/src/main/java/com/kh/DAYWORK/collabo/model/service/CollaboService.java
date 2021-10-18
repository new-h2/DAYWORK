package com.kh.DAYWORK.collabo.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DAYWORK.board.model.vo.Board;
import com.kh.DAYWORK.collabo.model.dao.CollaboDAO;
import com.kh.DAYWORK.collabo.model.vo.Collabo;
import com.kh.DAYWORK.collabo.model.vo.Feedback;
import com.kh.DAYWORK.member.model.vo.Member;

@Service("cService")
public class CollaboService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CollaboDAO cDAO;

	public int insertCollabo(Collabo co, Board bo) {
		int result = cDAO.insertCollaboB(sqlSession, bo);
		int bNo = cDAO.selectBNo(sqlSession, bo);
		co.setcBNo(bNo);
		if(result > 0) {
			result = cDAO.insertCollaboC(sqlSession, co);
		}
		return result;
		
	}

	public ArrayList<Collabo> selectListC(String mName) {
		return cDAO.selectListC(sqlSession, mName);
	}

	public int updateBtn(Collabo co) {
		return cDAO.updateBtn(sqlSession, co);
	}

	public void updateCollabo(Collabo co) {
		cDAO.updateCollaboB(sqlSession, co);
		
		cDAO.updateCollaboC(sqlSession, co);
		
	}

	public ArrayList<Collabo> selectCollaboCate(Collabo co) {
		ArrayList<Collabo> cList = new ArrayList<Collabo>();
		String cBctNo = co.getcBctNo();
		String cMNo = co.getcMNo()+"";
		
		
		if(cBctNo.equals(cMNo)){
			cList = cDAO.selectCateCMNo(sqlSession, co);
		} else if(cBctNo.equals("C1") || cBctNo.equals("C2") || cBctNo.equals("C3") || cBctNo.equals("C4") || cBctNo.equals("C5")) {
				cList = cDAO.selectCateCBctNo(sqlSession, co);
		}
		
		return cList;
	}

	public int insertFeedback(Feedback fb) {
//		int fCNo = fb.getfCNo();
//		Collabo c = cDAO.selcetCollabo(sqlSession, fCNo);
//		if(c.getFbStatus().equals('N')){
//		}
		int updateResult = 0;
		int result = 0;
		updateResult = cDAO.updateFBStatus(sqlSession, fb);
		if(updateResult > 0) {
			result = cDAO.insertFeedback(sqlSession, fb);
		}
		return result;
	}

	public ArrayList<Feedback> selectFeedback(int fCNo) {
		return cDAO.selectFeedback(sqlSession, fCNo);
	}

	public ArrayList<Member> selectMemberListC(String inputString) {
		return cDAO.selectMemberListC(sqlSession, inputString);
	}

	public int deleteCollabo(int cBNo) {
		return cDAO.deleteCollabo(sqlSession, cBNo);
	}


}
