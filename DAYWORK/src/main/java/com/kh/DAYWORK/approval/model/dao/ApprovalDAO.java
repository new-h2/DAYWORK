package com.kh.DAYWORK.approval.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DAYWORK.approval.model.vo.Approval;
import com.kh.DAYWORK.approval.model.vo.ApprovalForm;
import com.kh.DAYWORK.approval.model.vo.ApprovalStatus;
import com.kh.DAYWORK.member.model.vo.Member;

@Repository("aDAO")
public class ApprovalDAO {

	public ApprovalForm selectApForm(SqlSessionTemplate sqlSession, String title) {
		return sqlSession.selectOne("approval-mapper.selectApForm",title);
	}

	public int insertAp(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.insert("approval-mapper.insertAp",ap);
	}

	public List<Member> selectMembers(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("approval-mapper.selectMembers");
	}

	public List<Approval> selecList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("approval-mapper.selectList");
	}

	public Approval apDetail(SqlSessionTemplate sqlSession, int apNo) {
		return sqlSession.selectOne("approval-mapper.apDetail", apNo);
	}


	public int selectApNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("approval-mapper.selectApNo");
	}

	public int insertAs(SqlSessionTemplate sqlSession, ApprovalStatus as) {
		return sqlSession.insert("approval-mapper.insertAs", as);
	}

	public List<ApprovalStatus> asList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("approval-mapper.asList");
	}
	
	public int apUpdate(SqlSessionTemplate sqlSession, int apNo) {
		return sqlSession.update("approval-mapper.apUpdate", apNo);
	}


	public int apRejected(SqlSessionTemplate sqlSession, int apNo) {
		return sqlSession.update("approval-mapper.apRejected", apNo);
	}
	
	public int apDelete(SqlSessionTemplate sqlSession, int apNo) {
		return sqlSession.update("approval-mapper.apDelete", apNo);
	}

	public Approval selectSender(SqlSessionTemplate sqlSession, int apNo) {
		return sqlSession.selectOne("approval-mapper.selectSender", apNo);
	}





}
