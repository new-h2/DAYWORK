package com.kh.DAYWORK.chat.model.echoHandler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.DAYWORK.chat.model.service.ChatService;
import com.kh.DAYWORK.chat.model.vo.ChatMessage;

public class ChatEchoHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Autowired
	private ChatService chatService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		System.out.println("connect...");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String[] msgList = message.getPayload().split("/");
		int mNo = Integer.parseInt(msgList[0]);
		String mName = msgList[1];
		String roomNo = msgList[2];
		String msg = msgList[3];
		ChatMessage chatMsg = new ChatMessage(mNo, roomNo, mName, msg);
		
//		System.out.println(message.getPayload());
		int result = chatService.insertChatMsg(chatMsg);
		
		if(result > 0) {
			for(WebSocketSession s : sessionList) {
				s.sendMessage(new TextMessage(mNo + "/" + mName + "/" + roomNo + "/" + msg));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		System.out.println("end...");
	}
	
}
