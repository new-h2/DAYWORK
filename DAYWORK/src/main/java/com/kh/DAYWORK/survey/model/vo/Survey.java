package com.kh.DAYWORK.survey.model.vo;

import java.sql.Date;

public class Survey {
	private int sNo;
	private String sTitle;
	private String sContent;
	private Date sStartDate;
	private Date sEndDate;
	private String sStatus;
	private int mNo;
	private String ongoing;
	private String participants;
	private String mName;
	private String partiState; 
	private String sPublic;
	private String jName;

	public Survey() {}

	public Survey(int sNo, String sTitle, String sContent, Date sStartDate, Date sEndDate, String sStatus, int mNo,
			String ongoing, String participants, String mName, String partiState, String sPublic, String jName) {
		super();
		this.sNo = sNo;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sStartDate = sStartDate;
		this.sEndDate = sEndDate;
		this.sStatus = sStatus;
		this.mNo = mNo;
		this.ongoing = ongoing;
		this.participants = participants;
		this.mName = mName;
		this.partiState = partiState;
		this.sPublic = sPublic;
		this.jName = jName;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public Date getsStartDate() {
		return sStartDate;
	}

	public void setsStartDate(Date sStartDate) {
		this.sStartDate = sStartDate;
	}

	public Date getsEndDate() {
		return sEndDate;
	}

	public void setsEndDate(Date sEndDate) {
		this.sEndDate = sEndDate;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getOngoing() {
		return ongoing;
	}

	public void setOngoing(String ongoing) {
		this.ongoing = ongoing;
	}

	public String getParticipants() {
		return participants;
	}

	public void setParticipants(String participants) {
		this.participants = participants;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getPartiState() {
		return partiState;
	}

	public void setPartiState(String partiState) {
		this.partiState = partiState;
	}

	public String getsPublic() {
		return sPublic;
	}

	public void setsPublic(String sPublic) {
		this.sPublic = sPublic;
	}

	public String getjName() {
		return jName;
	}

	public void setjName(String jName) {
		this.jName = jName;
	}

	@Override
	public String toString() {
		return "Survey [sNo=" + sNo + ", sTitle=" + sTitle + ", sContent=" + sContent + ", sStartDate=" + sStartDate
				+ ", sEndDate=" + sEndDate + ", sStatus=" + sStatus + ", mNo=" + mNo + ", ongoing=" + ongoing
				+ ", participants=" + participants + ", mName=" + mName + ", partiState=" + partiState + ", sPublic="
				+ sPublic + ", jName=" + jName + "]";
	}

}
