package com.kh.DAYWORK.survey.model.vo;

public class QnA {
	private String option;
	private String answer;
	
	public QnA() {}

	public QnA(String option, String answer) {
		super();
		this.option = option;
		this.answer = answer;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "QnA [option=" + option + ", answer=" + answer + "]";
	}	

}
