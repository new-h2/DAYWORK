package com.kh.DAYWORK.collabo.model.vo;

import java.sql.Date;

public class Feedback {
	private int fNo;
	private int fCNo;
	private int fMNo;
	private String fWriter;
	private String fContent;
	private Date fCreateDate;
	private Date fModifyDate;
	private String fStatus;
	private String jName;
	private String dName;
	private String mRenameProfile;
	
	public Feedback() {}

	public Feedback(int fNo, int fCNo, int fMNo, String fWriter, String fContent, Date fCreateDate, Date fModifyDate,
			String fStatus, String jName, String dName, String mRenameProfile) {
		super();
		this.fNo = fNo;
		this.fCNo = fCNo;
		this.fMNo = fMNo;
		this.fWriter = fWriter;
		this.fContent = fContent;
		this.fCreateDate = fCreateDate;
		this.fModifyDate = fModifyDate;
		this.fStatus = fStatus;
		this.jName = jName;
		this.dName = dName;
		this.mRenameProfile = mRenameProfile;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public int getfCNo() {
		return fCNo;
	}

	public void setfCNo(int fCNo) {
		this.fCNo = fCNo;
	}

	public int getfMNo() {
		return fMNo;
	}

	public void setfMNo(int fMNo) {
		this.fMNo = fMNo;
	}

	public String getfWriter() {
		return fWriter;
	}

	public void setfWriter(String fWriter) {
		this.fWriter = fWriter;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public Date getfCreateDate() {
		return fCreateDate;
	}

	public void setfCreateDate(Date fCreateDate) {
		this.fCreateDate = fCreateDate;
	}

	public Date getfModifyDate() {
		return fModifyDate;
	}

	public void setfModifyDate(Date fModifyDate) {
		this.fModifyDate = fModifyDate;
	}

	public String getfStatus() {
		return fStatus;
	}

	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
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

	public String getmRenameProfile() {
		return mRenameProfile;
	}

	public void setmRenameProfile(String mRenameProfile) {
		this.mRenameProfile = mRenameProfile;
	}

	@Override
	public String toString() {
		return "Feedback [fNo=" + fNo + ", fCNo=" + fCNo + ", fMNo=" + fMNo + ", fWriter=" + fWriter + ", fContent="
				+ fContent + ", fCreateDate=" + fCreateDate + ", fModifyDate=" + fModifyDate + ", fStatus=" + fStatus
				+ ", jName=" + jName + ", dName=" + dName + ", mRenameProfile=" + mRenameProfile + "]";
	}

	
	
}
