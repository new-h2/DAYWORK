package com.kh.DAYWORK.survey.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DAYWORK.address.model.vo.PageInfo;
import com.kh.DAYWORK.survey.model.vo.Answer;
import com.kh.DAYWORK.survey.model.vo.Question;
import com.kh.DAYWORK.survey.model.vo.Survey;

@Repository
public class SurveyDAO {

	// 페이징에 사용 할 listCount 가져오기
	public int getListCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("survey-mapper.getListCount", map);
	}

	// 설문 리스트 뽑기
	public ArrayList<Survey> surveyList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds row = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("survey-mapper.surveyList", map, row);
	}

	// 설문에 등록할 설문 정보 저장하기
	public int insertSurvey(SqlSessionTemplate sqlSession, Survey s) {
		return sqlSession.insert("survey-mapper.insertSurvey", s);
	}

	// 설문에 등록할 질문 정보 저장하기
	public int insertQuestion(SqlSessionTemplate sqlSession, String[] question, String[] option, int sNo) {
		int result = 0; 
		for(int i = 0 ; i < question.length ; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("question", question[i]);
			map.put("option", option[i]);
			map.put("sNo", sNo);

			result += sqlSession.insert("survey-mapper.insertQuestion", map);
		}
		
		return result;
	}

	// 가장 최신의 설문 정보 가져오기
	public Survey getNewestSurvey(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("survey-mapper.getNewestSurvey");
	}

	// 특정 설문 정보 가져오기
	public Survey selectSurvey(SqlSessionTemplate sqlSession, int sNo) {
		return sqlSession.selectOne("survey-mapper.selectSurvey", sNo);
	}

	// 특정 질문 정보 가져오기
	public ArrayList<Question> selectQuestion(SqlSessionTemplate sqlSession, int sNo) {
		return (ArrayList)sqlSession.selectList("survey-mapper.selectQuestion", sNo);
	}

	// 설문에 참여해서 입력한 값 저장하기
	public int patricipateSurvey(SqlSessionTemplate sqlSession, ArrayList answerList, int[] qNo, int getsNo) {
		int result = 0;
		for(int i = 0 ; i < qNo.length ; i++) {
			HashMap map = new HashMap();
			map.put("sNo", getsNo);
			map.put("answer", answerList.get(i));
			map.put("qNo", qNo[i]);
			
			result += sqlSession.insert("survey-mapper.participateSurvey", map);
		}
		
		return result;
	}

	// 설문에 참여한 사람 저장하기
	public int addParticipant(SqlSessionTemplate sqlSession, String newParticipants, int getsNo) {
		HashMap map = new HashMap();
		map.put("sNo", getsNo);
		map.put("newParticipants", newParticipants);
		return sqlSession.update("survey-mapper.addParticipant", map);
	}

	// 특정 설문 답변을 가져오기
	public ArrayList<Answer> selectAnswer(SqlSessionTemplate sqlSession, Integer sNo) {
		return (ArrayList)sqlSession.selectList("survey-mapper.selectAnswer", sNo);
	}

	// 모든 설문 정보 가져오기
	public ArrayList<Survey> getAllSurvey(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("survey-mapper.getAllSurvey");
	}

	// 설문의 상태를 변경하기
	public int updateOngoing(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.update("survey-mapper.updateOngoing", map);
	}

	public int deleteSurvey(SqlSessionTemplate sqlSession, Integer sNo) {
		return sqlSession.update("survey-mapper.deleteSurvey", sNo);
	}

}
