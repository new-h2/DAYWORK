package com.kh.DAYWORK.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DAYWORK.chat.model.vo.ChatMessage;
import com.kh.DAYWORK.chat.model.vo.ChatRoom;

@Repository("chatDAO")
public class ChatDAO {

//	public int getChatRoom(SqlSessionTemplate sqlSession, ChatRoom chatRoom) {
//		return sqlSession.selectOne("chat-mapper.getChatRoom", chatRoom);
//	}

	public ArrayList<ChatMessage> chatMsgList(SqlSessionTemplate sqlSession, ChatRoom chatRoom) {
		return (ArrayList)sqlSession.selectList("chat-mapper.chatMsgList", chatRoom);
	}

	public int createChatRoom(SqlSessionTemplate sqlSession, ChatRoom chatRoom) {
		return sqlSession.insert("chat-mapper.createChatRoom", chatRoom);
	}

	public int insertChatMsg(SqlSessionTemplate sqlSession, ChatMessage chatMsg) {
		return sqlSession.insert("chat-mapper.insertChatMsg", chatMsg);
	}

	public ChatRoom getChatRoom(SqlSessionTemplate sqlSession, ChatRoom chatRoom) {
		return sqlSession.selectOne("chat-mapper.getChatRoom", chatRoom);
	}

	public ArrayList<ChatRoom> getChatRoomList(SqlSessionTemplate sqlSession, int mNo) {
		return (ArrayList)sqlSession.selectList("chat-mapper.getChatRoomList", mNo);
	}

	public int addParticipant(SqlSessionTemplate sqlSession, ChatRoom chatRoom) {
		return sqlSession.update("chat-mapper.addParticipant", chatRoom);
	}

	public ChatRoom selectChatRoom(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.selectOne("chat-mapper.selectChatRoom", roomNo);
	}

	public String getPName(SqlSessionTemplate sqlSession, String participant) {
		return sqlSession.selectOne("chat-mapper.getPName", participant);
	}

	public ArrayList<ChatMessage> firstMsgList(SqlSessionTemplate sqlSession, ArrayList<Integer> roomNoList) {
		
		ArrayList<ChatMessage> msgList = new ArrayList<ChatMessage>();
		for(Integer i : roomNoList) {
			ChatMessage msg = sqlSession.selectOne("chat-mapper.firstMsgList", i);
			if(msg != null) {
				msgList.add(msg);				
			}
		}
		
		return msgList;
	}

	public String getPProfile(SqlSessionTemplate sqlSession, String participant) {
		return sqlSession.selectOne("chat-mapper.getPProfile", participant);
	}

}
