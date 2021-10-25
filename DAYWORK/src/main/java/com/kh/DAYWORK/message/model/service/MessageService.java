package com.kh.DAYWORK.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DAYWORK.common.BMsgFile;
import com.kh.DAYWORK.member.model.vo.Member;
import com.kh.DAYWORK.message.model.dao.MessageDAO;
import com.kh.DAYWORK.message.model.vo.Message;

@Service("msgService")
public class MessageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MessageDAO msgDAO;

	public int getAllListCount(int mNo) {
		return msgDAO.getAllListCount(sqlSession, mNo);
	}
	
	public ArrayList<Message> selectAllMsgList(HashMap<String, Integer> map) {
		return msgDAO.selectAllMsgList(sqlSession, map);
	}

	public ArrayList<Member> selectMList(String receiver) {
		return msgDAO.selectMList(sqlSession, receiver);
	}

	public int insertMsg(ArrayList<Message> msgList, ArrayList<BMsgFile> fileList) {
		
		int result1 = 0;
		int result2 = 0;
		
		for(Message msg : msgList) {
			result1 = msgDAO.insertMsg(sqlSession, msg);
			
			if(result1 > 0) {
				int msgNo = msgDAO.selectMsgNo(sqlSession);
				for(int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setfMsgNo(msgNo);
				}
				result2 = msgDAO.insertFile(sqlSession, fileList);
			}
		}
		
		return result1 + result2;
	}

	public int getSendListCount(int mNo) {
		return msgDAO.getSendListCount(sqlSession, mNo);
	}

	public ArrayList<Message> selectSendMsgList(HashMap<String, Integer> map) {
		return msgDAO.selectSendMsgList(sqlSession, map);
	}

	public int getReceiveListCount(int mNo) {
		return msgDAO.getReceiveListCount(sqlSession, mNo);
	}

	public ArrayList<Message> selectReceiveMsgList(HashMap<String, Integer> map) {
		return msgDAO.selectReceiveMsgList(sqlSession, map);
	}

	public ArrayList<Message> selectMsg(String msgSecNo, String msgRead, int msgNo) {
		
		ArrayList<Message> msgList = new ArrayList<Message>();
		if(msgRead == null || msgRead.equals("Y")) {
			msgList = msgDAO.selectMsg(sqlSession, msgSecNo);
		} else {
			int result = msgDAO.readMsg(sqlSession, msgNo);
			if(result > 0) {
				msgList = msgDAO.selectMsg(sqlSession, msgSecNo);
			}
		}
		
		return msgList;
	}

	public ArrayList<BMsgFile> selectFile(int msgNo) {
		return msgDAO.selectFile(sqlSession, msgNo);
	}
}
