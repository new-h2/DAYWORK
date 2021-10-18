package com.kh.DAYWORK.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DAYWORK.member.model.vo.Commute;
import com.kh.DAYWORK.member.model.vo.Member;
import com.kh.DAYWORK.member.model.vo.MemberPageInfo;

@Repository("mDAO")
public class MemberDAO {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("member-mapper.insertMembers", m);
	}

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("member-mapper.loginMember", m);
	}

	public Member selectMno(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("member-mapper.selectMno", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int selectMno) {
		return sqlSession.selectOne("member-mapper.selectMember", selectMno);
	}

	public int insertProfile(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("member-mapper.insertProfile", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("member-mapper.updateMember", m);
	}

	public int updateMemberProfile(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("member-mapper.updateMemberProfile", m);
	}
	
	// 관리자페이지
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("member-mapper.getListCount");
	}
	
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, MemberPageInfo mpi) {
		int offset = mpi.getBoardLimit() * (mpi.getCurrentPage() -1);  
		RowBounds rowBounds = new RowBounds(offset, mpi.getBoardLimit()); 
		ArrayList<Member> mList =  (ArrayList)sqlSession.selectList("member-mapper.selectMemberList",null, rowBounds);
		return mList;
	}

	public int updateBtnN(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.update("member-mapper.updateBtnN", mNo);
	}

	public int updateBtnY(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.update("member-mapper.updateBtnY", mNo);
	}

	public int updateDeptJob(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("member-mapper.updateDeptJob", m);
	}
 
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("member-mapper.selectMemberListBasic");
	}

	public ArrayList<Member> selectInputName(SqlSessionTemplate sqlSession, String inputName, MemberPageInfo mpi) {
		int offset = mpi.getBoardLimit() * (mpi.getCurrentPage() -1);  
		RowBounds rowBounds = new RowBounds(offset, mpi.getBoardLimit());
		ArrayList<Member> mList= (ArrayList)sqlSession.selectList("member-mapper.selectInputName", inputName, rowBounds);
		return mList;
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Member user) {
		return sqlSession.update("member-mapper.updatePwd", user);		
	}
	
	
	

	
	// commute 관련
	public int workStart(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.insert("member-mapper.workStart", mNo);
	}

	public int updateCom(SqlSessionTemplate sqlSession, int comNo) {
		return sqlSession.update("member-mapper.updateCom", comNo);
	}

	public ArrayList<Commute> selectComList(SqlSessionTemplate sqlSession, int mNo) {
		return (ArrayList)sqlSession.selectList("member-mapper.selectComList", mNo);
	}

	public Commute selectTime(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("member-mapper.selectTime", mNo);
	}



}
