package com.kh.DAYWORK.calendar.model.vo;


public class Calendar {
	private int calNo;
	private int calCate;
	private String calStart;
	private String calEnd;
	private String calContent;
	private String calAllDay;
	private String calStatus;
	private int mNo;
	private String dCode;
	private String jCode;
	
	public Calendar() {
		
	}

	

	public Calendar(int calNo, int calCate, String calStart, String calEnd, String calContent, String calAllDay,
			String calStatus, int mNo, String dCode, String jCode) {
		super();
		this.calNo = calNo;
		this.calCate = calCate;
		this.calStart = calStart;
		this.calEnd = calEnd;
		this.calContent = calContent;
		this.calAllDay = calAllDay;
		this.calStatus = calStatus;
		this.mNo = mNo;
		this.dCode = dCode;
		this.jCode = jCode;
	}

	

	public String getjCode() {
		return jCode;
	}

	public void setjCode(String jCode) {
		this.jCode = jCode;
	}
	
	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}

	public int getCalCate() {
		return calCate;
	}

	public void setCalCate(int calCate) {
		this.calCate = calCate;
	}

	public String getCalStart() {
		return calStart;
	}

	public void setCalStart(String calStart) {
		this.calStart = calStart;
	}

	public String getCalEnd() {
		return calEnd;
	}

	public void setCalEnd(String calEnd) {
		this.calEnd = calEnd;
	}

	public String getCalContent() {
		return calContent;
	}

	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}

	public String getCalAllDay() {
		return calAllDay;
	}

	public void setCalAllDay(String calAllDay) {
		this.calAllDay = calAllDay;
	}

	public String getCalStatus() {
		return calStatus;
	}

	public void setCalStatus(String calStatus) {
		this.calStatus = calStatus;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	
	
	public String getdCode() {
		return dCode;
	}

	public void setdCode(String dCode) {
		this.dCode = dCode;
	}



	@Override
	public String toString() {
		return "Calendar [calNo=" + calNo + ", calCate=" + calCate + ", calStart=" + calStart + ", calEnd=" + calEnd
				+ ", calContent=" + calContent + ", calAllDay=" + calAllDay + ", calStatus=" + calStatus + ", mNo="
				+ mNo + ", dCode=" + dCode + ", jCode=" + jCode + "]";
	}

	

	
}

