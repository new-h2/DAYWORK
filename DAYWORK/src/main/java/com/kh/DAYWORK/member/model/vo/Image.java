package com.kh.DAYWORK.member.model.vo;

public class Image {
	private int iNo;
	private String iOrigin;
	private String iChange;
	private String iPath;
	private String iStatus;
	private int iMNO;
	
	public Image() {}

	public Image(int iNo, String iOrigin, String iChange, String iPath, String iStatus, int iMNO) {
		super();
		this.iNo = iNo;
		this.iOrigin = iOrigin;
		this.iChange = iChange;
		this.iPath = iPath;
		this.iStatus = iStatus;
		this.iMNO = iMNO;
	}

	public int getiNo() {
		return iNo;
	}

	public void setiNo(int iNo) {
		this.iNo = iNo;
	}

	public String getiOrigin() {
		return iOrigin;
	}

	public void setiOrigin(String iOrigin) {
		this.iOrigin = iOrigin;
	}

	public String getiChange() {
		return iChange;
	}

	public void setiChange(String iChange) {
		this.iChange = iChange;
	}

	public String getiPath() {
		return iPath;
	}

	public void setiPath(String iPath) {
		this.iPath = iPath;
	}

	public String getiStatus() {
		return iStatus;
	}

	public void setiStatus(String iStatus) {
		this.iStatus = iStatus;
	}

	public int getiMNO() {
		return iMNO;
	}

	public void setiMNO(int iMNO) {
		this.iMNO = iMNO;
	}

	@Override
	public String toString() {
		return "Image [iNo=" + iNo + ", iOrigin=" + iOrigin + ", iChange=" + iChange + ", iPath=" + iPath + ", iStatus="
				+ iStatus + ", iMNO=" + iMNO + "]";
	}
	
	

}
