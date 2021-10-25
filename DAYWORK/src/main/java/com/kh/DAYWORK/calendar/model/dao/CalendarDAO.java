package com.kh.DAYWORK.calendar.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DAYWORK.calendar.model.vo.Calendar;
import com.kh.DAYWORK.member.model.vo.Commute;

@Repository("calDAO")
public class CalendarDAO {

	public int insertCal(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.insert("calendar-mapper.insertCal", cal);
	}

	public ArrayList<Calendar> selectCal(SqlSessionTemplate sqlSession, Calendar cal) {
		return (ArrayList)sqlSession.selectList("calendar-mapper.selectCal", cal);
	}

	public int updateCal(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.update("calendar-mapper.updateCal", cal);
	}

	public int deleteCal(SqlSessionTemplate sqlSession, int calNo) {
		return sqlSession.update("calendar-mapper.deleteCal", calNo);
	}

	public String selectJname(SqlSessionTemplate sqlSession, String userJcode) {
		return sqlSession.selectOne("calendar-mapper.selectJname", userJcode);
	}

	public int insertVac(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.insert("calendar-mapper.insertVac", cal);
	}

	public int acceptVac(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.update("calendar-mapper.acceptVac", cal);
	}

	public int updateVac(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.update("calendar-mapper.updateVac", cal);
	}

	public int acceptVacComm(SqlSessionTemplate sqlSession, Commute c) {
		return sqlSession.insert("calendar-mapper.acceptVacComm", c);
	}

	public Calendar selectOneCal(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.selectOne("calendar-mapper.selectOneCal", cal);
	}


}
