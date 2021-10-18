package com.kh.DAYWORK.survey.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.DAYWORK.address.exception.AddressException;
import com.kh.DAYWORK.address.model.vo.PageInfo;
import com.kh.DAYWORK.common.Pagination;
import com.kh.DAYWORK.member.model.vo.Member;
import com.kh.DAYWORK.survey.exception.SurveyException;
import com.kh.DAYWORK.survey.model.service.SurveyService;
import com.kh.DAYWORK.survey.model.vo.Answer;
import com.kh.DAYWORK.survey.model.vo.QnA;
import com.kh.DAYWORK.survey.model.vo.Question;
import com.kh.DAYWORK.survey.model.vo.Survey;

@Controller
public class SurveyController {

	@Autowired
	private SurveyService sService;

	// 설문 리스트 조회
	@RequestMapping("surveyList.su")
	public String surveyList(HttpSession session, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key,
			@RequestParam(value = "status", required = false, defaultValue = "zero") String status, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		// 설문 시작일과 마감일을 확인해서 설문의 상태(마감, 진행중)를 변경함
		if (page == null) {
			ArrayList<Survey> list = sService.getAllSurvey();
			Date today = new Date();
			Calendar date = Calendar.getInstance();
			date.add(Calendar.DATE, -1);
			Date yesterday = new Date(date.getTimeInMillis());

			for (int i = 0; i < list.size(); i++) {
				int onStatus = 1;
				if (today.before(list.get(i).getsStartDate())) {
					onStatus = 0;
				} else if (yesterday.after(list.get(i).getsEndDate())) {
					onStatus = 2;
				}

				HashMap map = new HashMap();
				map.put("status", onStatus);
				map.put("sNo", list.get(i).getsNo());

				sService.updateOngoing(map);
			}
		}

		// 검색할 값과 상태를 받아오기
		HashMap map = new HashMap();
		map.put("key", key);
		map.put("status", status);

		int listCount = sService.getListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Survey> list = sService.surveyList(pi, map);


		if (list != null) {
			// 설문리스트에서 로그인한 사람이 설문조사에 참여 했는지 파악하기
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getParticipants() != null) {
					String[] participant = list.get(i).getParticipants().split(",");
					for (int j = 0; j < participant.length; j++) {
						if (Integer.parseInt(participant[j]) == loginUser.getmNo()) {
							list.get(i).setPartiState("Y");
							break;
						} else {
							list.get(i).setPartiState("N");
						}
					}
				} else {
					list.get(i).setPartiState("N");
				}
			}
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("key", key);
			model.addAttribute("status", status);
			model.addAttribute("loginUserNo", loginUser.getmNo());

			return "surveyList";
		} else {
			throw new AddressException("주소록 조회에 실패하였습니다.");
		}
	}

	// 설문 등록하기 페이지 이동
	@RequestMapping("surveyForm.su")
	public String surveyForm() {
		return "surveyForm";
	}

	// 설문 등록하기
	@RequestMapping("insertSurvey.su")
	public String insertSurvey(HttpSession session, @ModelAttribute Survey s, @RequestParam("optionsKey") String option,
			@RequestParam("questionsKey") String question) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		String[] questions = question.split("@");
		String[] options = option.split("/");

		s.setmNo(loginUser.getmNo());
		
		int result = sService.insertSurvey(s);

		if (result > 0) {
			Survey newestS = sService.getNewestSurvey();
			
			int result2 = sService.insertQuestion(questions, options, newestS.getsNo());

			if (result2 == questions.length) {
				return "redirect:surveyList.su";
			}
		}

		throw new SurveyException("설문 등록에 실패하였습니다.");
	}
	
	// 설문 조사 양식
	@RequestMapping("detailSurvey.su")
	public String detailSurvey(HttpSession session, @RequestParam("sNo") Integer sNo, Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		Survey s = sService.selectSurvey(sNo);
		ArrayList<Question> q = sService.selectQuestion(sNo);

		model.addAttribute("Survey", s);
		model.addAttribute("Question", q);
		model.addAttribute("loginUserNo", loginUser.getmNo());

		if(s != null) {
			return "survey";			
		} else {
			throw new SurveyException("설문 조사 양식 불러오기에 실패했습니다.");
		}
	}

	// 설문조사 참여하기 
	@RequestMapping("participateSurvey.su")
	public String participateSurvey(HttpServletRequest request, HttpSession session, @RequestParam("sNo") Integer sNo) {

		ArrayList<String> answerList = new ArrayList<String>();
		Member loginUser = (Member) session.getAttribute("loginUser");
		int num = 1;

		// 작성한 답변을 가져오기
		while (true) {
			String answer = request.getParameter("answer" + num);

			if (answer == null) {
				break;
			}
			answerList.add(answer);
			num++;
		}

		// 질문 번호 가져오기
		String[] strqNo = request.getParameterValues("qNo");
		int[] qNo = new int[strqNo.length];
		for (int i = 0; i < qNo.length; i++) {
			qNo[i] = Integer.parseInt(strqNo[i]);
		}

		Survey s = sService.selectSurvey(sNo);

		// 설문 참여자 정보 넣기
		if (s.getParticipants() == null) {
			s.setParticipants("");
		}
		String newParticipants = s.getParticipants() + loginUser.getmNo() + ",";

		int result = sService.participateSurvey(answerList, qNo, s.getsNo(), newParticipants);

		if (result == qNo.length + 1) {
			return "redirect:surveyList.su";
		} else {
			throw new SurveyException("설문조사 참여에 실패하였습니다.");
		}
	}

	// 설문 결과 조회
	@RequestMapping("resultSurvey.su")
	public String resultSurvey(HttpSession session, @RequestParam("sNo") Integer sNo, Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		Survey s = sService.selectSurvey(sNo);
		ArrayList<Question> q = sService.selectQuestion(sNo);
		ArrayList<Answer> a = sService.selectAnswer(sNo);

		// 설문의 질문과 답을 맞춰서 Question객체에 저장
		for (int i = 0; i < q.size(); i++) {
			ArrayList<QnA> list = new ArrayList();
			ArrayList answers = new ArrayList();
			int[] sum = new int[q.get(i).getOption().split("@").length];
			String strSum = "";
			
			for (int j = 0; j < a.size(); j++) {
				if (a.get(j).getqNo() == q.get(i).getqNo()) {
					answers.add(a.get(j).getAnswer());
				}
			}

			if (!q.get(i).getOption().equals("null@")) {
				for (int j = 0; j < answers.size(); j++) {
					for (int k = 0; k < q.get(i).getOption().split("@").length; k++) {
						if (Integer.valueOf((String) answers.get(j)) == k + 1) {
							sum[k]++;
						}
					}
				}
			} else {
				for (int j = 0; j < answers.size(); j++) {
					strSum += answers.get(j) + ",";
				}
			}

			for (int j = 0; j < q.get(i).getOption().split("@").length; j++) {
				QnA qna = new QnA();
				qna.setOption(q.get(i).getOption().split("@")[j]);
				if (strSum == "") {
					qna.setAnswer(sum[j] + "");
				} else {
					qna.setAnswer(strSum);
				}
				list.add(qna);
			}
			q.get(i).setList(list);
		}

		model.addAttribute("Survey", s);
		model.addAttribute("Question", q);
		model.addAttribute("loginUserNo", loginUser.getmNo());

		if (s.getParticipants() == null) {
			model.addAttribute("participantCount", "0");
		} else {
			model.addAttribute("participantCount", s.getParticipants().split(",").length);
		}

		return "surveyResult";
	}
	
	// 설문 삭제하기
	@RequestMapping("deleteSurvey.su")
	public String deleteSurvey(@RequestParam("sNo") Integer sNo) {
		
		int result = sService.deleteSurvey(sNo);
		
		return "redirect:surveyList.su";
	}

}
