package com.kh.DAYWORK.board.model.vo;

import java.sql.Date;

public class Reply {
	private int rNo;
	private String rContent;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rStatus;
	private int rMNo;
	private int rBNo;
	private String mName;
	private String jName;
	private String dName;
	private String rMRenameProfile;
	
	public Reply() {}

	public Reply(int rNo, String rContent, Date rCreateDate, Date rModifyDate, String rStatus, int rMNo, int rBNo,
			String mName, String jName, String dName) {
		super();
		this.rNo = rNo;
		this.rContent = rContent;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
		this.rMNo = rMNo;
		this.rBNo = rBNo;
		this.mName = mName;
		this.jName = jName;
		this.dName = dName;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrModifyDate() {
		return rModifyDate;
	}

	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int getrMNo() {
		return rMNo;
	}

	public void setrMNo(int rMNo) {
		this.rMNo = rMNo;
	}

	public int getrBNo() {
		return rBNo;
	}

	public void setrBNo(int rBNo) {
		this.rBNo = rBNo;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getjName() {
		return jName;
	}

	public void setjName(String jName) {
		this.jName = jName;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getrMRenameProfile() {
		return rMRenameProfile;
	}

	public void setrMRenameProfile(String rMRenameProfile) {
		this.rMRenameProfile = rMRenameProfile;
	}

	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", rContent=" + rContent + ", rCreateDate=" + rCreateDate + ", rModifyDate="
				+ rModifyDate + ", rStatus=" + rStatus + ", rMNo=" + rMNo + ", rBNo=" + rBNo + ", mName=" + mName
				+ ", jName=" + jName + ", dName=" + dName + ", rMRenameProfile=" + rMRenameProfile + "]";
	}
}
