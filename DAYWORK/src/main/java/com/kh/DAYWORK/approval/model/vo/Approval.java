package com.kh.DAYWORK.approval.model.vo;

import java.sql.Date;

public class Approval {

	private int apNo;
	private String apKeep;
	private Date apDate;
	private Integer apReceiver;
	private Integer apSender;
	private String apStatus;
	private String apCate;
	private String apTitle;
	private String apContent;
	private String apLine;
	private String apUpdate;
	private String apCtitle;
	private int mNo;
	private String mName;
	
	
	public Approval(){}


	public Approval(int apNo, String apKeep, Date apDate, Integer apReceiver, Integer apSender, String apStatus,
			String apCate, String apTitle, String apContent, String apLine, String apUpdate, String apCtitle, int mNo,
			String mName) {
		super();
		this.apNo = apNo;
		this.apKeep = apKeep;
		this.apDate = apDate;
		this.apReceiver = apReceiver;
		this.apSender = apSender;
		this.apStatus = apStatus;
		this.apCate = apCate;
		this.apTitle = apTitle;
		this.apContent = apContent;
		this.apLine = apLine;
		this.apUpdate = apUpdate;
		this.apCtitle = apCtitle;
		this.mNo = mNo;
		this.mName = mName;
	}


	public int getApNo() {
		return apNo;
	}


	public void setApNo(int apNo) {
		this.apNo = apNo;
	}


	public String getApKeep() {
		return apKeep;
	}


	public void setApKeep(String apKeep) {
		this.apKeep = apKeep;
	}


	public Date getApDate() {
		return apDate;
	}


	public void setApDate(Date apDate) {
		this.apDate = apDate;
	}


	public Integer getApReceiver() {
		return apReceiver;
	}


	public void setApReceiver(Integer apReceiver) {
		this.apReceiver = apReceiver;
	}


	public Integer getApSender() {
		return apSender;
	}


	public void setApSender(Integer apSender) {
		this.apSender = apSender;
	}


	public String getApStatus() {
		return apStatus;
	}


	public void setApStatus(String apStatus) {
		this.apStatus = apStatus;
	}


	public String getApCate() {
		return apCate;
	}


	public void setApCate(String apCate) {
		this.apCate = apCate;
	}


	public String getApTitle() {
		return apTitle;
	}


	public void setApTitle(String apTitle) {
		this.apTitle = apTitle;
	}


	public String getApContent() {
		return apContent;
	}


	public void setApContent(String apContent) {
		this.apContent = apContent;
	}


	public String getApLine() {
		return apLine;
	}


	public void setApLine(String apLine) {
		this.apLine = apLine;
	}


	public String getApUpdate() {
		return apUpdate;
	}


	public void setApUpdate(String apUpdate) {
		this.apUpdate = apUpdate;
	}


	public String getApCtitle() {
		return apCtitle;
	}


	public void setApCtitle(String apCtitle) {
		this.apCtitle = apCtitle;
	}


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	@Override
	public String toString() {
		return "Approval [apNo=" + apNo + ", apKeep=" + apKeep + ", apDate=" + apDate + ", apReceiver=" + apReceiver
				+ ", apSender=" + apSender + ", apStatus=" + apStatus + ", apCate=" + apCate + ", apTitle=" + apTitle
				+ ", apContent=" + apContent + ", apLine=" + apLine + ", apUpdate=" + apUpdate + ", apCtitle="
				+ apCtitle + ", mNo=" + mNo + ", mName=" + mName + ", getApNo()=" + getApNo() + ", getApKeep()="
				+ getApKeep() + ", getApDate()=" + getApDate() + ", getApReceiver()=" + getApReceiver()
				+ ", getApSender()=" + getApSender() + ", getApStatus()=" + getApStatus() + ", getApCate()="
				+ getApCate() + ", getApTitle()=" + getApTitle() + ", getApContent()=" + getApContent()
				+ ", getApLine()=" + getApLine() + ", getApUpdate()=" + getApUpdate() + ", getApCtitle()="
				+ getApCtitle() + ", getmNo()=" + getmNo() + ", getmName()=" + getmName() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}



	


	
	

}
