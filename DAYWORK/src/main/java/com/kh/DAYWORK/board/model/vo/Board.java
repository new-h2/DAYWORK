package com.kh.DAYWORK.board.model.vo;

import java.sql.Date;

public class Board {
	private int bNo;
	private String bDept;
	private String bTitle;
	private String bContent;
	private Date bCreateDate;
	private Date bModifyDate;
	private int bCount;
	private String bType;
	private String bStatus;
	private int bMNo;
	private String mName;
	private int boardNew;
	private String bReply;
	private String bTopFixed;
	
	public Board() {}

	public Board(int bNo, String bDept, String bTitle, String bContent, Date bCreateDate, Date bModifyDate, int bCount,
			String bType, String bStatus, int bMNo, String mName, int boardNew, String bReply) {
		super();
		this.bNo = bNo;
		this.bDept = bDept;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCreateDate = bCreateDate;
		this.bModifyDate = bModifyDate;
		this.bCount = bCount;
		this.bType = bType;
		this.bStatus = bStatus;
		this.bMNo = bMNo;
		this.mName = mName;
		this.boardNew = boardNew;
		this.bReply = bReply;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbDept() {
		return bDept;
	}

	public void setbDept(String bDept) {
		this.bDept = bDept;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbCreateDate() {
		return bCreateDate;
	}

	public void setbCreateDate(Date bCreateDate) {
		this.bCreateDate = bCreateDate;
	}

	public Date getbModifyDate() {
		return bModifyDate;
	}

	public void setbModifyDate(Date bModifyDate) {
		this.bModifyDate = bModifyDate;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public int getbMNo() {
		return bMNo;
	}

	public void setbMNo(int bMNo) {
		this.bMNo = bMNo;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getBoardNew() {
		return boardNew;
	}

	public void setBoardNew(int boardNew) {
		this.boardNew = boardNew;
	}

	public String getbReply() {
		return bReply;
	}

	public void setbReply(String bReply) {
		this.bReply = bReply;
	}

	public String getbTopFixed() {
		return bTopFixed;
	}

	public void setbTopFixed(String bTopFixed) {
		this.bTopFixed = bTopFixed;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bDept=" + bDept + ", bTitle=" + bTitle + ", bContent=" + bContent
				+ ", bCreateDate=" + bCreateDate + ", bModifyDate=" + bModifyDate + ", bCount=" + bCount + ", bType="
				+ bType + ", bStatus=" + bStatus + ", bMNo=" + bMNo + ", mName=" + mName + ", boardNew=" + boardNew
				+ ", bReply=" + bReply + ", bTopFixed=" + bTopFixed + "]";
	}

}
