package com.kh.DAYWORK.survey.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DAYWORK.address.model.vo.PageInfo;
import com.kh.DAYWORK.survey.model.dao.SurveyDAO;
import com.kh.DAYWORK.survey.model.vo.Answer;
import com.kh.DAYWORK.survey.model.vo.Question;
import com.kh.DAYWORK.survey.model.vo.Survey;

@Service("sService")
public class SurveyService {

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Autowired
	private SurveyDAO sDAO;

	public ArrayList<Survey> surveyList(PageInfo pi, HashMap map) {
		return sDAO.surveyList(sqlSession, pi, map);
	}

	public int getListCount(HashMap map) {
		return sDAO.getListCount(sqlSession, map);
	}

	public int insertSurvey(Survey s) {
		return sDAO.insertSurvey(sqlSession, s);
	}

	public int insertQuestion(String[] question, String[] option, int sNo) {
		return sDAO.insertQuestion(sqlSession, question, option, sNo);
	}

	public Survey getNewestSurvey() {
		return sDAO.getNewestSurvey(sqlSession);
	}

	public Survey selectSurvey(int sNo) {
		return sDAO.selectSurvey(sqlSession, sNo);
	}

	public ArrayList<Question> selectQuestion(int sNo) {
		return sDAO.selectQuestion(sqlSession, sNo);
	}

	public int participateSurvey(ArrayList answerList, int[] qNo, int getsNo, String newParticipants) {
		return sDAO.patricipateSurvey(sqlSession, answerList, qNo, getsNo) + sDAO.addParticipant(sqlSession, newParticipants, getsNo);
	}

	public ArrayList<Answer> selectAnswer(Integer sNo) {
		return sDAO.selectAnswer(sqlSession, sNo);
	}
	
	public ArrayList<Survey> getAllSurvey() {
		return sDAO.getAllSurvey(sqlSession);
	}
	
	public int updateOngoing(HashMap map) {
		return sDAO.updateOngoing(sqlSession, map);
	}

	public int deleteSurvey(Integer sNo) {
		return sDAO.deleteSurvey(sqlSession, sNo);
	}

}
