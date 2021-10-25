package com.kh.DAYWORK.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.DAYWORK.calendar.model.exception.CalendarException;
import com.kh.DAYWORK.member.model.exception.MemberException;
import com.kh.DAYWORK.member.model.service.MemberService;
import com.kh.DAYWORK.member.model.vo.Commute;
import com.kh.DAYWORK.member.model.vo.Member;
import com.kh.DAYWORK.member.model.vo.MemberPageInfo;
import com.kh.DAYWORK.member.model.vo.MemberPagination;

import net.sf.json.JSONArray;

@SessionAttributes({"loginUser", "comTime"})  
@Controller
public class MemberController {
	
	@Autowired 
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("joinMember.me")
	public String goJoinMember() {
		return "joinMember";
	}
	
	
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m,
							   @RequestParam("post") String post,
							   @RequestParam("address1") String address1,
							   @RequestParam("address2") String address2,
							   @RequestParam("year") int year,
							   @RequestParam("month") int month,
							   @RequestParam("date") int date) throws MemberException {
		Date birthDay = new Date(new GregorianCalendar(year, month-1, date).getTimeInMillis());
		m.setmBirthDay(birthDay);
		m.setmAddress(post + "/" + address1 + "/" + address2);
		
		String encPwd = bcrypt.encode(m.getmPwd());
		m.setmPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "redirect:home.do";
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	@RequestMapping("login.me")
	public String loginMember(@ModelAttribute Member m, Model model) throws MemberException {
		Member loginUser = mService.loginMember(m);
		boolean match = bcrypt.matches(m.getmPwd(), loginUser.getmPwd());
		
		if(match) {
			model.addAttribute("loginUser", loginUser);
			
			Commute comTime = mService.selectTime(loginUser.getmNo());			
			model.addAttribute("comTime", comTime);
		
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
			return "../../../index";
		}
		
		return "redirect:calendar.ca";
	}
	
	public void returnLoginUser() {
		
	}
	
	@RequestMapping("/logout.me")
	public String logout(SessionStatus session) {
		session.setComplete();
		
		return "../../../index";
	}
	
	@RequestMapping("gowhereMno.me")
	public String goWhereMno() {
		return "whereMno";
	}
	
	@RequestMapping("whereMno.me")
	public String whereMno(@ModelAttribute Member m, Model model) throws MemberException{
		Member member = mService.selectMno(m);
		
		if(member != null) {
//			if(member.getmAdmin() == 1 || member.getmAdmin() == 0) {
				model.addAttribute("member", member);
				return "whereMno";
//			} else if(member.getmAdmin() == 2) {
//				model.addAttribute("member", member);
//				return "redirect:home.do";
//			}
		}else {
			model.addAttribute("msg", "입력하신 정보는 확인되지 않습니다.");
			return "redirect:goWhereMno.me";
		}
	}
	
	@RequestMapping("goMypage.me")
	public ModelAndView goMypage(ModelAndView mv, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		mv.addObject("m", loginUser);
		mv.setViewName("myPage");
		return mv;
	}
	
	@RequestMapping("update.me")
	public String updateMember(@ModelAttribute Member m,  
							   @RequestParam("post") String post,
							   @RequestParam("address1") String address1,
							   @RequestParam("address2") String address2,
							   @RequestParam("uploadFile") MultipartFile uploadFile, 
							   HttpServletRequest request,
							   HttpSession session, Model model) throws MemberException {
		int result = 0;
		
		m.setmAddress(post + "/" + address1 + "/" + address2);
		int selectMno = m.getmNo();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(uploadFile.getOriginalFilename() != "") {
			if(loginUser.getmRenameProfile() != null) { // 파일 있었는데 바꿀 때
				deleteFile(request, m);
			}  
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName != null) {
				m.setmOriginProfile(uploadFile.getOriginalFilename());
				m.setmRenameProfile(renameFileName);
			}
			result = mService.updateMember(m);
		} else if(uploadFile.getOriginalFilename() == ""){// 파일 아예 없을 때
			result = mService.updateMemberProfile(m);
		}
			
		if(result > 0) {
			m = mService.selectMember(selectMno);
			model.addAttribute("loginUser", m);
			return "redirect:goMypage.me";
		}else {
			throw new MemberException("변경실패");
		}
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) { 
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\mProfileFiles"; 
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs(); 
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
									+ originFileName.substring(originFileName.lastIndexOf(".") +1); 
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러");
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	public void deleteFile(HttpServletRequest request, Member m) {
		String root = request.getSession().getServletContext().getRealPath("resources"); //폴더접근
		String savePath = root + "\\mProfileFiles";
		
		File f = new File(savePath + "\\" + m.getmRenameProfile());
		if(f.exists()) { 
			f.delete(); 
		}
	}
	
	@RequestMapping("gowherePwd.me")
	public String gowherePwd() {
		return "wherePwd";
	}
	
	@RequestMapping("wherePwd.me")
	public String wherePwd(@ModelAttribute Member m, Model model, HttpServletRequest request) throws MemberException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String msg = null;
		Member user = mService.loginMember(m);	
		
		if(user == null || !user.getmEmail().equals(m.getmEmail())) {				
			msg = "사번 또는 이메일을 확인해주세요.";
			model.addAttribute("msg", msg);
			return "wherePwd";				
		} else {
			final String sender = "dayworkcommon@naver.com";
			final String password = "daywork1234!";
			
			String receiver = m.getmEmail();
			String title = "[DAYWORK] 임시 비밀번호가 발송되었습니다.";
			String newPwd = getRandomPwd(8);
			
			String path = request.getSession().getServletContext().getRealPath("resources");
			System.out.println(path);
			String img = "https://postfiles.pstatic.net/MjAyMTA5MTBfNDMg/MDAxNjMxMjA0MDU0ODAx.5VybaEjUpQPpnvGQEGDAKZBC6JcNY48xWj3dQM1wIOcg.JQq3rW27wn4BrJJkyHNNpQvrwDNi4USMborZ_Y9tAgIg.PNG.dayworkcommon/SE-4a7a31ae-ee72-45d4-aa6e-a487391e4276.png?type=w966";
			String contents = "<br><br><div align='center'><img src ='" + img + "'<br><br><h3>" + newPwd + "</h3></div>";
			String host = "smtp.naver.com";
			
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
							
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(sender, password);
				}
			});
			
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(sender));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
				
				message.setSubject(title);
				
				message.setText(contents, "UTF-8", "html");
				
				Transport.send(message);
				System.out.println("전송 O");
			} catch (MessagingException e) {
				System.out.println("전송 X");
				e.printStackTrace();
			}
			
			user.setmPwd(bcrypt.encode(newPwd));			
			int result = mService.updatePwd(user);
			if(result > 0) {
				return "redirect: home.do"; 
			} else {
				throw new MemberException("비밀번호 찾기에 실패하였습니다.");
			}
		}
		
	}
	
	// 임시 비밀번호 생성 메소드
	public String getRandomPwd(int len) {
		char[] charSet = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
				'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
		};
		
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		
		int index = 0;
		int length = charSet.length;
		for(int i = 0; i < len; i++) {
			index = sr.nextInt(length);
			sb.append(charSet[index]);			
		}
		return sb.toString();
	}

	
	// 관리자 페이지
	
	@RequestMapping("goAdmin.me")
	public ModelAndView goAdmin(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws MemberException {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getListCount();
		MemberPageInfo mpi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member>mList = mService.selectMemberList(mpi);
		
		if(mList != null) {
			mv.addObject("mList", mList).addObject("mpi",mpi);
			mv.setViewName("adminPage");
		} else {
			throw new MemberException("사원 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("updateMember.me")
	public String updateMember(@ModelAttribute Member m ) {
		return null;
	}
	
	// 퇴사처리
	@RequestMapping("updateBtnN.me")
	public String updateBtnN(@RequestParam("mNo")int mNo) throws MemberException {
		int result = mService.updateBtnN(mNo);
		
		if(result>0) {
			return "redirect:goAdmin.me";
		} else {
			throw new MemberException("퇴사 처리에 실패하였습니다.");
		}
	}
	
	//입사처리
	@RequestMapping("updateBtnY.me")
	public String updateBtnY(@RequestParam("mNo")int mNo) throws MemberException {
		int result = mService.updateBtnY(mNo);
		
		if(result>0) {
			return "redirect:goAdmin.me";
		} else {
			throw new MemberException("입사 처리에 실패하였습니다.");
		}
	}
	
	// 부서 직급 변경
	@RequestMapping("updateDeptJob.me")
	@ResponseBody
	public String updateDeptJob(@RequestBody String data,
									HttpServletResponse response) throws MemberException {
		response.setContentType("application/json; charset=UTF-8");
		Member m = new Member();
		int mNo = 0;
		String dCode = null;
		String jCode = null;
		int result = 0;
		
		List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
		resultMap = JSONArray.fromObject(data);
		
		for(Map<String,Object> map : resultMap) {
			m.setmNo(Integer.parseInt((map.get("mNo")).toString()));
			m.setdCode((String)(map.get("dept")));
			m.setjCode((String) (map.get("job")));
			result = mService.updateDeptJob(m);
		}
		
		if(result>0) {
			return "success";
		} else {
			throw new MemberException("상태 변경에 실패하였습니다.");
		}
	}
	
	@RequestMapping("selectInputName.me")
	public ModelAndView goAdmin(@RequestParam(value="page", required=false) Integer page, ModelAndView mv,
								@RequestParam("inputName") String inputName) throws MemberException {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getListCount();
		MemberPageInfo mpi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member>mList = mService.selectInputName(inputName, mpi);
		
		if(mList != null) {
			mv.addObject("mList", mList).addObject("mpi",mpi);
			mv.setViewName("adminPage");
		} else {
			throw new MemberException("사원 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// workManagement 관련
		@RequestMapping("workManage.me")
		public String workManage() {
			return "workManagement";
		}	
		
		@RequestMapping("workStart.me")
		public String workStart(HttpServletRequest request, Model model) {
			int mNo = ((Member)request.getSession().getAttribute("loginUser")).getmNo();
			
			int result = mService.workStart(mNo);
			
			if(result > 0) {
				Commute comTime = mService.selectTime(mNo);
				
				model.addAttribute("comTime", comTime);
				
				return "redirect:workManage.me";
			} else {
				throw new CalendarException("출근 등록에 실패하였습니다.");
			}
		}	
		
		@RequestMapping("workEnd.me")
		public String workEnd(HttpServletRequest request, Model model) {
			int mNo = ((Member)request.getSession().getAttribute("loginUser")).getmNo();
			int comNo = mService.selectTime(mNo).getComNo();
			
			int result = mService.updateCom(comNo);
			
			if(result > 0) {
				Commute comTime = mService.selectTime(mNo);
				
				model.addAttribute("comTime", comTime);
				
				return "redirect:workManage.me";
			} else {
				throw new CalendarException("퇴근 등록에 실패하였습니다.");
			}
		}
		
		@RequestMapping("selectComList.me")
		public void selectComList(@RequestParam("mNo") int mNo, HttpServletResponse response) {
			response.setContentType("application/json; charset=UTF-8");
			
			ArrayList<Commute> list = mService.selectComList(mNo);
			Gson gson = new GsonBuilder().create();
			
			try {
				gson.toJson(list, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	
}
