package com.kh.DAYWORK.message.model.vo;

import java.sql.Date;

public class Message {
	private int msgNo;
	private String msgTitle;
	private String msgContent;
	private String msgStatus;
	private String msgWriter;
	private String msgReceiver;	
	private Date msgDate;
	private String msgRead;
	private int msgWriterMNo;
	private int msgReceiverMNo;
	private String msgSecNo;
	
	public Message() {}

	public Message(int msgNo, String msgTitle, String msgContent, String msgStatus, String msgWriter,
			String msgReceiver, Date msgDate, String msgRead, int msgWriterMNo, int msgReceiverMNo, String msgSecNo) {
		super();
		this.msgNo = msgNo;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.msgStatus = msgStatus;
		this.msgWriter = msgWriter;
		this.msgReceiver = msgReceiver;
		this.msgDate = msgDate;
		this.msgRead = msgRead;
		this.msgWriterMNo = msgWriterMNo;
		this.msgReceiverMNo = msgReceiverMNo;
		this.msgSecNo = msgSecNo;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(String msgStatus) {
		this.msgStatus = msgStatus;
	}

	public String getMsgWriter() {
		return msgWriter;
	}

	public void setMsgWriter(String msgWriter) {
		this.msgWriter = msgWriter;
	}

	public String getMsgReceiver() {
		return msgReceiver;
	}

	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
	}

	public Date getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}
	
	public String getMsgRead() {
		return msgRead;
	}

	public void setMsgRead(String msgRead) {
		this.msgRead = msgRead;
	}

	public int getMsgWriterMNo() {
		return msgWriterMNo;
	}

	public void setMsgWriterMNo(int msgWriterMNo) {
		this.msgWriterMNo = msgWriterMNo;
	}

	public int getMsgReceiverMNo() {
		return msgReceiverMNo;
	}

	public void setMsgReceiverMNo(int msgReceiverMNo) {
		this.msgReceiverMNo = msgReceiverMNo;
	}
	
	public String getMsgSecNo() {
		return msgSecNo;
	}

	public void setMsgSecNo(String msgSecNo) {
		this.msgSecNo = msgSecNo;
	}

	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", msgTitle=" + msgTitle + ", msgContent=" + msgContent + ", msgStatus="
				+ msgStatus + ", msgWriter=" + msgWriter + ", msgReceiver=" + msgReceiver + ", msgDate=" + msgDate
				+ ", msgRead=" + msgRead + ", msgWriterMNo=" + msgWriterMNo + ", msgReceiverMNo=" + msgReceiverMNo
				+ ", msgSecNo=" + msgSecNo + "]";
	}
}
