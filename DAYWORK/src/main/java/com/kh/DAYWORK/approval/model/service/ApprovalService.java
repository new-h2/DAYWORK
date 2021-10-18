package com.kh.DAYWORK.approval.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DAYWORK.approval.model.dao.ApprovalDAO;
import com.kh.DAYWORK.approval.model.vo.Approval;
import com.kh.DAYWORK.approval.model.vo.ApprovalForm;
import com.kh.DAYWORK.approval.model.vo.ApprovalStatus;
import com.kh.DAYWORK.member.model.vo.Member;

@Service("aService")
public class ApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDAO aDAO;

	public ApprovalForm selectApForm(String title) {
		
		return aDAO.selectApForm(sqlSession, title);
	}

	public int insertAp(Approval ap) {
		int result1 = aDAO.insertAp(sqlSession, ap);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = aDAO.selectApNo(sqlSession);
		}
		return result1+result2;
	}

	public List<Member> selectMembers() {
		return aDAO.selectMembers(sqlSession);
	}

	public List<Approval> selecList() {
		return aDAO.selecList(sqlSession);
	}

	public Approval apDetail(int apNo) {
		return aDAO.apDetail(sqlSession,apNo);
	}

	public int selectApNo() {
		return aDAO.selectApNo(sqlSession);
	}
	
	public int insertAs(ApprovalStatus as) {
		return aDAO.insertAs(sqlSession,as);
	}

	public List<ApprovalStatus> asList() {
		return aDAO.asList(sqlSession);
	}
	
	public int apUpdate(int apNo) {
		return aDAO.apUpdate(sqlSession,apNo);
		
	}
	public int apRejected(int apNo) {
		return aDAO.apRejected(sqlSession,apNo);
	}

	public int apDelete(int apNo) {
		return aDAO.apDelete(sqlSession,apNo);
	}

	public Approval selectSender(int apNo) {
		return  aDAO.selectSender(sqlSession,apNo);
	}






	
	
}
