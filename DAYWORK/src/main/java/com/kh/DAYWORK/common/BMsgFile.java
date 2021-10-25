package com.kh.DAYWORK.common;

public class BMsgFile {
	private int fNo;
	private String fOrigin;
	private String fRename;
	private int fBNo;
	private int fMsgNo;
	
	public BMsgFile() {}

	public BMsgFile(int fNo, String fOrigin, String fRename, int fBNo, int fMsgNo) {
		super();
		this.fNo = fNo;
		this.fOrigin = fOrigin;
		this.fRename = fRename;
		this.fBNo = fBNo;
		this.fMsgNo = fMsgNo;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfOrigin() {
		return fOrigin;
	}

	public void setfOrigin(String fOrigin) {
		this.fOrigin = fOrigin;
	}

	public String getfRename() {
		return fRename;
	}

	public void setfRename(String fRename) {
		this.fRename = fRename;
	}

	public int getfBNo() {
		return fBNo;
	}

	public void setfBNo(int fBNo) {
		this.fBNo = fBNo;
	}

	public int getfMsgNo() {
		return fMsgNo;
	}

	public void setfMsgNo(int fMsgNo) {
		this.fMsgNo = fMsgNo;
	}

	@Override
	public String toString() {
		return "BMsgFile [fNo=" + fNo + ", fOrigin=" + fOrigin + ", fRename=" + fRename + ", fBNo=" + fBNo + ", fMsgNo="
				+ fMsgNo + "]";
	}
}
