package com.kh.DAYWORK.collabo.model.vo;

import java.sql.Date;
import java.util.Arrays;

public class Collabo {
	private int cNo;
	private int cBNo;
	private int cMNo;
	private Date cStartDate;
	private Date cEndDate;
	private String cPeople;
	private String cFirst;
	private String cBctNo; 
	private String cBctStatus; 
	private String bTitle;
	private String bContent;
	private Date bModifyDate;
	private String bWriter;
	private String fbStatus;
	private String[] inputmember;
	
	public Collabo() {}
	
	

	public Collabo(int cNo, int cBNo, int cMNo, Date cStartDate, Date cEndDate, String cPeople, String cFirst,
			String cBctNo, String cBctStatus, String bTitle, String bContent, Date bModifyDate, String bWriter,
			String fbStatus, String[] inputmember) {
		super();
		this.cNo = cNo;
		this.cBNo = cBNo;
		this.cMNo = cMNo;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.cPeople = cPeople;
		this.cFirst = cFirst;
		this.cBctNo = cBctNo;
		this.cBctStatus = cBctStatus;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bModifyDate = bModifyDate;
		this.bWriter = bWriter;
		this.fbStatus = fbStatus;
		this.inputmember = inputmember;
	}



	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getcBNo() {
		return cBNo;
	}

	public void setcBNo(int cBNo) {
		this.cBNo = cBNo;
	}

	public int getcMNo() {
		return cMNo;
	}

	public void setcMNo(int cMNo) {
		this.cMNo = cMNo;
	}

	public Date getcStartDate() {
		return cStartDate;
	}

	public void setcStartDate(Date cStartDate) {
		this.cStartDate = cStartDate;
	}

	public Date getcEndDate() {
		return cEndDate;
	}

	public void setcEndDate(Date cEndDate) {
		this.cEndDate = cEndDate;
	}

	public String getcPeople() {
		return cPeople;
	}

	public void setcPeople(String cPeople) {
		this.cPeople = cPeople;
	}

	public String getcFirst() {
		return cFirst;
	}

	public void setcFirst(String cFirst) {
		this.cFirst = cFirst;
	}

	public String getcBctNo() {
		return cBctNo;
	}

	public void setcBctNo(String cBctNo) {
		this.cBctNo = cBctNo;
	}

	public String getcBctStatus() {
		return cBctStatus;
	}

	public void setcBctStatus(String cBctStatus) {
		this.cBctStatus = cBctStatus;
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

	public Date getbModifyDate() {
		return bModifyDate;
	}

	public void setbModifyDate(Date bModifyDate) {
		this.bModifyDate = bModifyDate;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getFbStatus() {
		return fbStatus;
	}

	public void setFbStatus(String fbStatus) {
		this.fbStatus = fbStatus;
	}

	public String[] getInputmember() {
		return inputmember;
	}

	public void setInputmember(String[] inputmember) {
		this.inputmember = inputmember;
	}



	@Override
	public String toString() {
		return "Collabo [cNo=" + cNo + ", cBNo=" + cBNo + ", cMNo=" + cMNo + ", cStartDate=" + cStartDate
				+ ", cEndDate=" + cEndDate + ", cPeople=" + cPeople + ", cFirst=" + cFirst + ", cBctNo=" + cBctNo
				+ ", cBctStatus=" + cBctStatus + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bModifyDate="
				+ bModifyDate + ", bWriter=" + bWriter + ", fbStatus=" + fbStatus + ", inputmember="
				+ Arrays.toString(inputmember) + "]";
	}

	
	
}
