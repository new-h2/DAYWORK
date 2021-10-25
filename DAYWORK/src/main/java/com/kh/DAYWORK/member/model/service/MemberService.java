package com.kh.DAYWORK.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DAYWORK.member.model.dao.MemberDAO;
import com.kh.DAYWORK.member.model.vo.Commute;
import com.kh.DAYWORK.member.model.vo.Member;
import com.kh.DAYWORK.member.model.vo.MemberPageInfo;

@Service("mService")
public class MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	
	public int insertMember(Member m) {
		
		return mDAO.insertMember(sqlSession, m);
	}


	public Member loginMember(Member m) {
		return mDAO.loginMember(sqlSession, m);
	}


	public Member selectMno(Member m) {
		return mDAO.selectMno(sqlSession, m);
	}


	public Member selectMember(int selectMno) {
		return mDAO.selectMember(sqlSession, selectMno);
	}


//	public void insertProfile(Member m) {
//		int result = mDAO.insertProfile(sqlSession, m);
//		if(result > 0) {
//			updateMember(m);
//		}
//	}


	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}


	public int updateMemberProfile(Member m) {
		return mDAO.updateMemberProfile(sqlSession, m);
	}
	
	
	// 관리자페이지

	public int getListCount() {
		return mDAO.getListCount(sqlSession);
	}
	
	public ArrayList<Member> selectMemberList(MemberPageInfo mpi) {
		return mDAO.selectMemberList(sqlSession, mpi);
	}


	public int updateBtnN(int mNo) {
		return mDAO.updateBtnN(sqlSession, mNo);
	}


	public int updateBtnY(int mNo) {
		return mDAO.updateBtnY(sqlSession, mNo);
	}


	public int updateDeptJob(Member m) {
		return mDAO.updateDeptJob(sqlSession, m);
	}


	public ArrayList<Member> selectMemberList() {
		return mDAO.selectMemberList(sqlSession);
	}


	public ArrayList<Member> selectInputName(String inputName, MemberPageInfo mpi) {
		return mDAO.selectInputName(sqlSession, inputName, mpi);
	}
	
	public int updatePwd(Member user) {
		return mDAO.updatePwd(sqlSession, user);
	}
	
	
	

	
	// commute 관련
	public int workStart(int mNo) {
		return mDAO.workStart(sqlSession, mNo);
	}

	public int updateCom(int comNo) {
		return mDAO.updateCom(sqlSession, comNo);
	}

	public ArrayList<Commute> selectComList(int mNo) {
		return mDAO.selectComList(sqlSession, mNo);
	}

	public Commute selectTime(int mNo) {
		return mDAO.selectTime(sqlSession, mNo);
	}





}
