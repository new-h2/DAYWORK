package com.kh.DAYWORK.chat.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.DAYWORK.chat.model.service.ChatService;
import com.kh.DAYWORK.chat.model.vo.ChatMessage;
import com.kh.DAYWORK.chat.model.vo.ChatRoom;
import com.kh.DAYWORK.member.model.vo.Member;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@RequestMapping("createChatRoom.chat")
	@ResponseBody
	public void createOrGetChatRoom(@RequestParam("participant") String participant, HttpSession session, HttpServletResponse response) {
		
		int makerNo = ((Member)session.getAttribute("loginUser")).getmNo();
		String pName = chatService.getPName(participant);
		String pProfile = chatService.getPProfile(participant);
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmsssss");
//		int ranNum = (int)(Math.random() * 10000);
//		String chatRoomNo = sdf.format(new Date(System.currentTimeMillis())) + ranNum;
		
		ChatRoom chatRoom = new ChatRoom(makerNo, participant, pName);
		chatRoom.setmComma(makerNo + ",");
		chatRoom.setpComma(participant + ",");
		
		ChatRoom chatRoom2 = new ChatRoom(makerNo, participant + ",", pName + ",");
		chatRoom2.setcRoomProfile(pProfile);
		
		ChatRoom cr1 = chatService.getChatRoom(chatRoom);
		ChatRoom cr2 = null;
		ArrayList<ChatMessage> chatMsgList = new ArrayList<ChatMessage>();
		ArrayList<ChatRoom> crList = new ArrayList<ChatRoom>();
		
		if(cr1 != null) {
			crList.add(cr1);
			chatMsgList = chatService.chatMsgList(chatRoom, cr1.getcRoomNo());			
		} else {
			int result = chatService.createChatRoom(chatRoom2);
			if(result > 0) {
				cr2 = chatService.getChatRoom(chatRoom);
				crList.add(cr2);
			}
		}
		
		
		HashMap<String, List> map = new HashMap<String, List>();
		map.put("chatMsgList", chatMsgList);
		map.put("chatRoom", crList);
		
		GsonBuilder gb = new GsonBuilder().setDateFormat("hh:mm");
		Gson gson  = gb.create();
		response.setContentType("application/json; charset=UTF-8");
		
		if(cr1 != null || cr2 != null) {
			try {
				gson.toJson(map, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				gson.toJson("fail", response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
//	public boolean checkPNo(String pNoList, String pNo) { 
//		String[] arr = pNoList.split("/");
//				
//		for(String s : arr) {
//			if(s.equals(pNo)) {
//				return true;
//			}
//		}
//		return false;
//	}
//	
//	public boolean checkPName(String pNameList, String pName) {
//		String[] arr = pNameList.split("/");
//		
//		for(String s : arr) {
//			if(s.equals(pName)) {
//				return true;
//			}
//		}
//		return false;
//	}
	
	@RequestMapping("getChatRoomList.chat")
	@ResponseBody
	public void getChatRoomList(HttpSession session, HttpServletResponse response) {
		
		int mNo = ((Member)session.getAttribute("loginUser")).getmNo();
		
		ArrayList<ChatRoom> crList = chatService.getChatRoomList(mNo);
		
		ArrayList<Integer> roomNoList = new ArrayList<Integer>();
		for(ChatRoom cr : crList) {
			roomNoList.add(cr.getcRoomNo());
		}
		
		ArrayList<ChatMessage> msgList = chatService.firstMsgList(roomNoList);
		
		HashMap<String, ArrayList> map = new HashMap<String, ArrayList>();
		map.put("crList", crList);
		map.put("msgList", msgList);
//		for(int i = 0; i < crList.size(); i++) {
//			ChatRoom cr1 = crList.get(i);
//			
//			String participant = "";
//			if(!cr1.getcRoomPName().equals(mName)) {
//				participant += cr1.getcRoomPName() + ", ";	
//			} else {
//				participant += cr1.getcRoomMName();
//			}
//			
//			for(int j = i+1; j < crList.size(); j++) {
//				ChatRoom cr2 = crList.get(j);
//				if(cr2.getcRoomNo().equals(cr1.getcRoomNo())) {
//					if(!cr2.getcRoomPName().equals(mName)) {
//						participant += cr2.getcRoomPName() + ", ";	
//					} else {
//						participant += cr2.getcRoomMName();
//					}
//					crList.remove(j);
//				}
//			}
//			
//			String roomNo = cr1.getcRoomNo();
//			ChatRoom chatInfo = new ChatRoom();
//			chatInfo.setcRoomNo(roomNo);
//			chatInfo.setcRoomPName(participant);
//			
//			crInfo.add(chatInfo);
//		}
		
		GsonBuilder gb = new GsonBuilder().setDateFormat("MM-dd hh:mm");
		Gson gson  = gb.create();
		response.setContentType("application/json; charset=UTF-8");
		
		if(crList != null && crList.size() > 0) {
			try {
				gson.toJson(map, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				gson.toJson("empty", response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("addParticipant.chat")
	@ResponseBody
	public void addParticipant(@RequestParam("newP") String newP, @RequestParam("roomNo") int roomNo, 
							   @RequestParam("presentP") String presentP, @RequestParam("mNo") int mNo,
							   HttpSession session, HttpServletResponse response) {
		
		ChatRoom cr1 = chatService.selectChatRoom(roomNo);
		String pName = chatService.getPName(newP);
		
		System.out.println(cr1.getcRoomPName());
		String addP = presentP + pName + ",";
		System.out.println(addP);
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8");
		
		if(cr1.getcRoomM() == mNo && cr1.getcRoomPName().equals(addP)) {
			try {
				gson.toJson("exist", response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			String pNoList = cr1.getcRoomP();
			pNoList += newP + ",";
			
			String pNameList = cr1.getcRoomPName();
			pNameList += pName + ",";
			
			ChatRoom cr2 = new ChatRoom();
			cr2.setcRoomNo(roomNo);
			cr2.setcRoomP(pNoList);
			cr2.setcRoomPName(pNameList);
			
			int result = chatService.addParticipant(cr2);
			
			if(result > 0) {
				try {
					gson.toJson(pName, response.getWriter());
				} catch (JsonIOException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@RequestMapping("getChatRoom.chat")
	@ResponseBody
	public void getChatRoom(@RequestParam("roomNo") int roomNo, HttpSession session, HttpServletResponse response) {
		
		ChatRoom cr1 = chatService.selectChatRoom(roomNo);
		
		ArrayList<ChatMessage> chatMsgList = new ArrayList<ChatMessage>();
		if(cr1 != null) {
			// 어짜피 같은 값이지만 chatMsgList를 쓰기위해 roomNo를 보내준다.
			chatMsgList = chatService.chatMsgList(cr1, roomNo);			
		}
		
		// 어짜피 한개지만 map으로 보내기위해 crList를 만들어 담아준다.
		ArrayList<ChatRoom> crList = new ArrayList<ChatRoom>();
		crList.add(cr1);
		
		HashMap<String, List> map = new HashMap<String, List>();
		map.put("chatMsgList", chatMsgList);
		map.put("chatRoom", crList);
		
		GsonBuilder gb = new GsonBuilder().setDateFormat("hh:mm");
		Gson gson  = gb.create();
		response.setContentType("application/json; charset=UTF-8");
		
		if(cr1 != null) {
			try {
				gson.toJson(map, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
