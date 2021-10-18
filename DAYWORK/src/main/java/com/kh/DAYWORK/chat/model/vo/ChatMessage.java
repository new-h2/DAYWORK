package com.kh.DAYWORK.chat.model.vo;

import java.sql.Timestamp;

public class ChatMessage {
	private int cMsgNo;
	private int cMsgWriterNo;
	private String cMsgRoomNo;
	private String cMsgWriterName;
	private String cMsgContent;
	private Timestamp cMsgDate;
	
	public ChatMessage() {}
	
	public ChatMessage(int cMsgWriterNo, String cMsgRoomNo, String cMsgWriterName, String cMsgContent) {
		super();
		this.cMsgWriterNo = cMsgWriterNo;
		this.cMsgRoomNo = cMsgRoomNo;
		this.cMsgWriterName = cMsgWriterName;
		this.cMsgContent = cMsgContent;
	}

	public ChatMessage(int cMsgNo, int cMsgWriterNo, String cMsgRoomNo, String cMsgWriterName, String cMsgContent) {
		super();
		this.cMsgNo = cMsgNo;
		this.cMsgWriterNo = cMsgWriterNo;
		this.cMsgRoomNo = cMsgRoomNo;
		this.cMsgWriterName = cMsgWriterName;
		this.cMsgContent = cMsgContent;
	}

	public ChatMessage(int cMsgNo, int cMsgWriterNo, String cMsgRoomNo, String cMsgWriterName, String cMsgContent,
			Timestamp cMsgDate) {
		super();
		this.cMsgNo = cMsgNo;
		this.cMsgWriterNo = cMsgWriterNo;
		this.cMsgRoomNo = cMsgRoomNo;
		this.cMsgWriterName = cMsgWriterName;
		this.cMsgContent = cMsgContent;
		this.cMsgDate = cMsgDate;
	}

	public int getcMsgNo() {
		return cMsgNo;
	}

	public void setcMsgNo(int cMsgNo) {
		this.cMsgNo = cMsgNo;
	}

	public String getcMsgRoomNo() {
		return cMsgRoomNo;
	}

	public void setcMsgRoomNo(String cMsgRoomNo) {
		this.cMsgRoomNo = cMsgRoomNo;
	}

	public int getcMsgWriterNo() {
		return cMsgWriterNo;
	}

	public void setcMsgWriterNo(int cMsgWriterNo) {
		this.cMsgWriterNo = cMsgWriterNo;
	}

	public String getcMsgWriterName() {
		return cMsgWriterName;
	}

	public void setcMsgWriterName(String cMsgWriterName) {
		this.cMsgWriterName = cMsgWriterName;
	}

	public String getcMsgContent() {
		return cMsgContent;
	}

	public void setcMsgContent(String cMsgContent) {
		this.cMsgContent = cMsgContent;
	}
	
	public Timestamp getcMsgDate() {
		return cMsgDate;
	}

	public void setcMsgDate(Timestamp cMsgDate) {
		this.cMsgDate = cMsgDate;
	}

	@Override
	public String toString() {
		return "ChatMessage [cMsgNo=" + cMsgNo + ", cMsgWriterNo=" + cMsgWriterNo + ", cMsgRoomNo=" + cMsgRoomNo
				+ ", cMsgWriterName=" + cMsgWriterName + ", cMsgContent=" + cMsgContent + ", cMsgDate=" + cMsgDate
				+ "]";
	}
}
