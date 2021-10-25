package com.kh.DAYWORK.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DAYWORK.common.BMsgFile;
import com.kh.DAYWORK.member.model.vo.Member;
import com.kh.DAYWORK.message.model.vo.Message;

@Repository("msgDAO")
public class MessageDAO {

	public int getAllListCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("message-mapper.getAllListCount", mNo);
	}

	public ArrayList<Message> selectAllMsgList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("message-mapper.selectAllMsgList", map);
	}

	public ArrayList<Member> selectMList(SqlSessionTemplate sqlSession, String receiver) {
		return (ArrayList)sqlSession.selectList("message-mapper.selectMList", receiver);
	}

	public int insertMsg(SqlSessionTemplate sqlSession, Message msg) {
		return sqlSession.insert("message-mapper.insertMsg", msg);
	}

	public int selectMsgNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("message-mapper.selectMsgNo");
	}

	public int insertFile(SqlSessionTemplate sqlSession, ArrayList<BMsgFile> fileList) {
		
		int result = 0;
		for(BMsgFile f : fileList) {
			result += sqlSession.insert("message-mapper.insertFile", f);
		}
		
		return result;
	}

	public int getSendListCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("message-mapper.getSendListCount", mNo);
	}

	public ArrayList<Message> selectSendMsgList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("message-mapper.selectSendMsgList", map);
	}

	public int getReceiveListCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("message-mapper.getReceiveListCount", mNo);
	}

	public ArrayList<Message> selectReceiveMsgList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("message-mapper.selectReceiveMsgList", map);
	}

	public ArrayList<Message> selectMsg(SqlSessionTemplate sqlSession, String msgSecNo) {
		return (ArrayList)sqlSession.selectList("message-mapper.selectMsg", msgSecNo);
	}

	public ArrayList<BMsgFile> selectFile(SqlSessionTemplate sqlSession, int msgNo) {
		return (ArrayList)sqlSession.selectList("message-mapper.selectFile", msgNo);
	}

	public int readMsg(SqlSessionTemplate sqlSession, int msgNo) {
		return sqlSession.update("message-mapper.readMsg", msgNo);
	}

}
