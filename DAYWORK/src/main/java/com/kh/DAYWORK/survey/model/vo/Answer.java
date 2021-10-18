package com.kh.DAYWORK.survey.model.vo;

public class Answer {
	private int aNo;
	private String answer;
	private int qNo;
	private int sNo;
	
	public Answer() {}

	public Answer(int aNo, String answer, int qNo, int sNo) {
		super();
		this.aNo = aNo;
		this.answer = answer;
		this.qNo = qNo;
		this.sNo = sNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	@Override
	public String toString() {
		return "Answer [aNo=" + aNo + ", answer=" + answer + ", qNo=" + qNo + ", sNo=" + sNo + "]";
	}
}
