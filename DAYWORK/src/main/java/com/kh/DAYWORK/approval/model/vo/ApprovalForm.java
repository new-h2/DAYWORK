package com.kh.DAYWORK.approval.model.vo;

import java.sql.Date;

public class ApprovalForm {
	private int afNo;
	private String afCate;
	private String afLine;
	private int afApNo;
	private String afTitle;
	private String afContent;
	private Date afDate;
	private String afEtc;
	private int writer;
	
	
	public ApprovalForm() {}


	public ApprovalForm(int afNo, String afCate, String afLine, int afApNo, String afTitle, String afContent,
			Date afDate, String afEtc, int writer) {
		super();
		this.afNo = afNo;
		this.afCate = afCate;
		this.afLine = afLine;
		this.afApNo = afApNo;
		this.afTitle = afTitle;
		this.afContent = afContent;
		this.afDate = afDate;
		this.afEtc = afEtc;
		this.writer = writer;
	}


	public int getAfNo() {
		return afNo;
	}


	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}


	public String getAfCate() {
		return afCate;
	}


	public void setAfCate(String afCate) {
		this.afCate = afCate;
	}


	public String getAfLine() {
		return afLine;
	}


	public void setAfLine(String afLine) {
		this.afLine = afLine;
	}


	public int getAfApNo() {
		return afApNo;
	}


	public void setAfApNo(int afApNo) {
		this.afApNo = afApNo;
	}


	public String getAfTitle() {
		return afTitle;
	}


	public void setAfTitle(String afTitle) {
		this.afTitle = afTitle;
	}


	public String getAfContent() {
		return afContent;
	}


	public void setAfContent(String afContent) {
		this.afContent = afContent;
	}


	public Date getAfDate() {
		return afDate;
	}


	public void setAfDate(Date afDate) {
		this.afDate = afDate;
	}


	public String getAfEtc() {
		return afEtc;
	}


	public void setAfEtc(String afEtc) {
		this.afEtc = afEtc;
	}


	public int getWriter() {
		return writer;
	}


	public void setWriter(int writer) {
		this.writer = writer;
	}


	@Override
	public String toString() {
		return "ApprovalForm [afNo=" + afNo + ", afCate=" + afCate + ", afLine=" + afLine + ", afApNo=" + afApNo
				+ ", afTitle=" + afTitle + ", afContent=" + afContent + ", afDate=" + afDate + ", afEtc=" + afEtc
				+ ", writer=" + writer + "]";
	}
	

}


