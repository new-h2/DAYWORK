package com.kh.DAYWORK.approval.model.vo;

import java.sql.Date;

public class ApprovalStatus {
	
	private int asNo; 
	private String asStatus; 
	private String asLine; 
	private Date asDate; 
	private int asApNo; 
	private int asApReceiver; 
	private String asMName; 
	private String asDName; 
	private String asJName;
	
	
	public ApprovalStatus() {}
	
	public ApprovalStatus(int asNo, String asStatus, String asLine, Date asDate, int asApNo, int asApReceiver,
			String asMName, String asDName, String asJName) {
		super();
		this.asNo = asNo;
		this.asStatus = asStatus;
		this.asLine = asLine;
		this.asDate = asDate;
		this.asApNo = asApNo;
		this.asApReceiver = asApReceiver;
		this.asMName = asMName;
		this.asDName = asDName;
		this.asJName = asJName;
	}

	public int getAsNo() {
		return asNo;
	}

	public void setAsNo(int asNo) {
		this.asNo = asNo;
	}

	public String getAsStatus() {
		return asStatus;
	}

	public void setAsStatus(String asStatus) {
		this.asStatus = asStatus;
	}

	public String getAsLine() {
		return asLine;
	}

	public void setAsLine(String asLine) {
		this.asLine = asLine;
	}

	public Date getAsDate() {
		return asDate;
	}

	public void setAsDate(Date asDate) {
		this.asDate = asDate;
	}

	public int getAsApNo() {
		return asApNo;
	}

	public void setAsApNo(int asApNo) {
		this.asApNo = asApNo;
	}

	public int getAsApReceiver() {
		return asApReceiver;
	}

	public void setAsApReceiver(int asApReceiver) {
		this.asApReceiver = asApReceiver;
	}

	public String getAsMName() {
		return asMName;
	}

	public void setAsMName(String asMName) {
		this.asMName = asMName;
	}

	public String getAsDName() {
		return asDName;
	}

	public void setAsDName(String asDName) {
		this.asDName = asDName;
	}

	public String getAsJName() {
		return asJName;
	}

	public void setAsJName(String asJName) {
		this.asJName = asJName;
	}

	@Override
	public String toString() {
		return "ApprovalStatus [asNo=" + asNo + ", asStatus=" + asStatus + ", asLine=" + asLine + ", asDate=" + asDate
				+ ", asApNo=" + asApNo + ", asApReceiver=" + asApReceiver + ", asMName=" + asMName + ", asDName="
				+ asDName + ", asJName=" + asJName + "]";
	} 
	
	

}
