package com.kh.DAYWORK.survey.model.vo;

import java.util.ArrayList;

public class Question {
	private int qNo;
	private String question;
	private String option;
	private int sNo;
	private ArrayList<QnA> list;
	
	public Question() {}

	public Question(int qNo, String question, String option, int sNo, ArrayList<QnA> list) {
		super();
		this.qNo = qNo;
		this.question = question;
		this.option = option;
		this.sNo = sNo;
		this.list = list;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public ArrayList<QnA> getList() {
		return list;
	}

	public void setList(ArrayList<QnA> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Question [qNo=" + qNo + ", question=" + question + ", option=" + option + ", sNo=" + sNo + ", list="
				+ list + "]";
	}

}