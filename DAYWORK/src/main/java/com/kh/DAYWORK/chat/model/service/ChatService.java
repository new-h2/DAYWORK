package com.kh.DAYWORK.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DAYWORK.chat.model.dao.ChatDAO;
import com.kh.DAYWORK.chat.model.vo.ChatMessage;
import com.kh.DAYWORK.chat.model.vo.ChatRoom;

@Service("chatService")
public class ChatService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDAO chatDAO;

//	public ArrayList createOrGetChatRoom(ChatRoom chatRoom) {
//		
//		ChatRoom cr = chatDAO.getChatRoom(sqlSession, chatRoom);
//		if(cr != null) {
//			ArrayList<ChatMessage> chatMsgList = chatDAO.chatMsgList(sqlSession, chatRoom);
//			return chatMsgList;
//		} else {
//			 int result = chatDAO.createChatRoom(sqlSession, chatRoom);
//			if(result > 0) {
//				ChatRoom cr2 = chatDAO.getChatRoom(sqlSession, chatRoom);
//				ArrayList<ChatRoom> cr3 = new ArrayList<ChatRoom>();
//				cr3.add(cr2);
//				return cr3;				
//			}
//		}
//		return null;
//	}

	public int insertChatMsg(ChatMessage chatMsg) {
		return chatDAO.insertChatMsg(sqlSession, chatMsg);
	}

	public ChatRoom getChatRoom(ChatRoom chatRoom) {
		return chatDAO.getChatRoom(sqlSession, chatRoom);
	}

	public ArrayList<ChatMessage> chatMsgList(ChatRoom chatRoom, int roomNo) {
		chatRoom.setcRoomNo(roomNo);
		return chatDAO.chatMsgList(sqlSession, chatRoom);
	}

	public int createChatRoom(ChatRoom chatRoom) {
		return chatDAO.createChatRoom(sqlSession, chatRoom);
	}

	public ArrayList<ChatRoom> getChatRoomList(int mNo) {
		return chatDAO.getChatRoomList(sqlSession, mNo);
	}

	public int addParticipant(ChatRoom chatRoom) {
		return chatDAO.addParticipant(sqlSession, chatRoom);
		
	}

	public String getPName(String participant) {
		return chatDAO.getPName(sqlSession, participant);
	}

	public ChatRoom selectChatRoom(int roomNo) {
		return chatDAO.selectChatRoom(sqlSession, roomNo);
	}

	public ArrayList<ChatMessage> firstMsgList(ArrayList<Integer> roomNoList) {
		return chatDAO.firstMsgList(sqlSession, roomNoList);
	}

	public String getPProfile(String participant) {
		return chatDAO.getPProfile(sqlSession, participant);
	}
	
}
