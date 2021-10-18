package com.kh.DAYWORK.calendar.model.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DAYWORK.calendar.model.dao.CalendarDAO;
import com.kh.DAYWORK.calendar.model.vo.Calendar;
import com.kh.DAYWORK.member.model.vo.Commute;

@Service("calService")
public class CalendarService {
	
	@Autowired
	private CalendarDAO calDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertCal(Calendar cal) {
		return calDAO.insertCal(sqlSession, cal);
	}

	public ArrayList<Calendar> selectCal(Calendar cal) {
		return calDAO.selectCal(sqlSession, cal);
	}

	public int updateCal(Calendar cal) {
		return calDAO.updateCal(sqlSession, cal);
	}

	public int deleteCal(int calNo) {
		return calDAO.deleteCal(sqlSession, calNo);
	}

	public String selectJname(String userJcode) {
		return calDAO.selectJname(sqlSession, userJcode);
	}

	public int insertVac(Calendar cal) {
		return calDAO.insertVac(sqlSession, cal);
	}

	public int acceptVac(Calendar cal) {
		
		int result = 0;
		
		result += calDAO.acceptVac(sqlSession, cal);
		
		
		if(result > 0) {
			
			cal = calDAO.selectOneCal(sqlSession, cal);
			String startStr = cal.getCalStart();
			String endStr = cal.getCalEnd();			
			
			int nameEnd = cal.getCalContent().substring(0).indexOf(" ") + 4;
			
			String comVac = cal.getCalContent().substring(nameEnd);
			
			java.util.Calendar startFormat = java.util.Calendar.getInstance();
			java.util.Calendar endFormat = java.util.Calendar.getInstance();
		
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				startFormat.setTime(format.parse(startStr));
				endFormat.setTime(format.parse(endStr));
				
				long diffSec = (endFormat.getTimeInMillis() - startFormat.getTimeInMillis()) / 1000;
				long diffDays = diffSec / (24*60*60);				
				
				for(int i = 0; i <= diffDays; i++) {
					
					startFormat.add(java.util.Calendar.DATE, i);
					String comDate = format.format(startFormat.getTime());
					
					Commute c = new Commute();
					
					c.setmNo(cal.getmNo());
					c.setComVac(comVac);
					c.setComStart(comDate);
					c.setComEnd(comDate);
					
					result += calDAO.acceptVacComm(sqlSession, c);
					
					startFormat.setTime(format.parse(startStr));
					
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}			
		}
		
		return result;
	}

	public int updateVac(Calendar cal) {
		return calDAO.updateVac(sqlSession, cal);
	}

}
