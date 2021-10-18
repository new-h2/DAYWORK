package com.kh.DAYWORK.message.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.DAYWORK.board.controller.BoardController;
import com.kh.DAYWORK.board.model.exception.BoardException;
import com.kh.DAYWORK.common.BMsgFile;
import com.kh.DAYWORK.member.model.vo.Member;
import com.kh.DAYWORK.message.model.exception.MessageException;
import com.kh.DAYWORK.message.model.service.MessageService;
import com.kh.DAYWORK.message.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService msgService;
	
	@RequestMapping("msgAllList.msg")
	public String msgAllList(@RequestParam(value="page", required=false) Integer page, HttpSession session, Model m) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int mNo = ((Member)session.getAttribute("loginUser")).getmNo();
		String mName = ((Member)session.getAttribute("loginUser")).getmName();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("currentPage", (currentPage-1)*10);
		map.put("mNo", mNo);
				
		int listCount = msgService.getAllListCount(mNo);
		ArrayList<Message> msgList = msgService.selectAllMsgList(map);
		
		int maxPage;
		if(listCount % 10 == 0) {
			maxPage = listCount / 10;
		} else {
			maxPage = listCount / 10 + 1;
		}
		
		int startPage = (currentPage - 1) / 10 * 10 + 1;
		
		int endPage = startPage + 10 - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(msgList != null) {
			m.addAttribute("msgList", msgList)
			 .addAttribute("maxPage", maxPage)
			 .addAttribute("startPage", startPage)
			 .addAttribute("endPage", endPage)
			 .addAttribute("currentPage", currentPage)
			 .addAttribute("mName", mName);
			 return "messageAll";
		} else {
			throw new MessageException("없는 페이지 입니다.");
		}
	}
	
	@RequestMapping("msgSendList.msg")
	public String msgSendList(@RequestParam(value="page", required=false) Integer page, HttpSession session, Model m) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int mNo = ((Member)session.getAttribute("loginUser")).getmNo();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("currentPage", (currentPage-1)*10);
		map.put("mNo", mNo);
				
		int listCount = msgService.getSendListCount(mNo);
		ArrayList<Message> msgList = msgService.selectSendMsgList(map);
		
		int maxPage;
		if(listCount % 10 == 0) {
			maxPage = listCount / 10;
		} else {
			maxPage = listCount / 10 + 1;
		}
		
		int startPage = (currentPage - 1) / 10 * 10 + 1;
		
		int endPage = startPage + 10 - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(msgList != null) {
			m.addAttribute("msgList", msgList)
			 .addAttribute("maxPage", maxPage)
			 .addAttribute("startPage", startPage)
			 .addAttribute("endPage", endPage)
			 .addAttribute("currentPage", currentPage);
			 return "messageSend";
		} else {
			throw new MessageException("없는 페이지 입니다.");
		}
	}
	
	@RequestMapping("msgReceiveList.msg")
	public String msgReceiveList(@RequestParam(value="page", required=false) Integer page, HttpSession session, Model m) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int mNo = ((Member)session.getAttribute("loginUser")).getmNo();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("currentPage", (currentPage-1)*10);
		map.put("mNo", mNo);
				
		int listCount = msgService.getReceiveListCount(mNo);
		ArrayList<Message> msgList = msgService.selectReceiveMsgList(map);
		
		int maxPage;
		if(listCount % 10 == 0) {
			maxPage = listCount / 10;
		} else {
			maxPage = listCount / 10 + 1;
		}
		
		int startPage = (currentPage - 1) / 10 * 10 + 1;
		
		int endPage = startPage + 10 - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(msgList != null) {
			m.addAttribute("msgList", msgList)
			 .addAttribute("maxPage", maxPage)
			 .addAttribute("startPage", startPage)
			 .addAttribute("endPage", endPage)
			 .addAttribute("currentPage", currentPage);
			 return "messageReceive";
		} else {
			throw new MessageException("없는 페이지 입니다.");
		}
	}
	
	@RequestMapping("goMessageWrite.msg")
	public String msgWrite(@RequestParam(value="mNo", required=false) Integer mNo,
						   @RequestParam(value="mWriter", required=false) String mWriter,
						   @RequestParam(value="msgTitle", required=false) String msgTitle, Model m) {
		m.addAttribute("mNo", mNo)
		 .addAttribute("mWriter", mWriter)
		 .addAttribute("msgTitle", msgTitle);
		return "messageWriteForm";
	}
	
	@RequestMapping("msgSearchMember.msg")
	@ResponseBody
	public void memberList(@RequestParam("receiver") String receiver, HttpServletResponse response) {
		
		ArrayList<Member> mList = msgService.selectMList(receiver);
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8");
		if(mList.size() == 0) {
			try {
				String msg = "일치하는 회원이 없습니다.";
				gson.toJson(msg, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				gson.toJson(mList, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("msgInsert.msg")
	@ResponseBody
	public String insertMsg(@ModelAttribute Message msg, @RequestParam(value="uploadFiles", required=false) List<MultipartFile> files, 
				  	      @RequestParam("receiver") int[] receiver, HttpServletResponse response,
				  	      HttpServletRequest request, HttpSession session, @RequestParam(value="deleteFiles", required=false) int[] deleteFiles) {
		
		ArrayList<BMsgFile> fileList = new ArrayList<BMsgFile>();
		ArrayList<Message> msgList = new ArrayList<Message>();
		BoardController bc = new BoardController();
		
//		for(MultipartFile file : files) {
//			System.out.println(file.getOriginalFilename());
//		}
		
		if(files != null && files.size() > 0) {
			if(deleteFiles != null) {
				for(int i = 0; i < deleteFiles.length; i++) {
					files.remove(deleteFiles[i]);
				}				
			}
			
			for(MultipartFile file : files) {
				String renameFileName = bc.saveFile(file, request, "/msguploadFiles");
				
				if(renameFileName != null) {
					BMsgFile f = new BMsgFile();
					f.setfOrigin(file.getOriginalFilename());
					f.setfRename(renameFileName);
					
					fileList.add(f);
				}
			}
		}		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmsssss");
		int ranNum = (int)(Math.random() * 10000);
		String msgSecNo = sdf.format(new Date(System.currentTimeMillis())) + ranNum;

		int mNo = ((Member)session.getAttribute("loginUser")).getmNo();
		String writer = ((Member)session.getAttribute("loginUser")).getmName();
		
		for(int i = 0; i < receiver.length; i++) {
			Message m = new Message();
			m.setMsgTitle(msg.getMsgTitle());
			m.setMsgContent(msg.getMsgContent());
			m.setMsgReceiverMNo(receiver[i]);
			m.setMsgWriterMNo(mNo);
			m.setMsgSecNo(msgSecNo);
			m.setMsgWriter(writer);
			msgList.add(m);
		}
		
		int result = msgService.insertMsg(msgList, fileList);
		if(result > 0) {
			return "success";
		} else {
			bc.deleteFile(request, fileList, "/msguploadFiles");
			throw new MessageException("메세지 전송에 실패하였습니다.");
		}
	}
	
	@RequestMapping("msgDetail.msg")
	public String selectMsg(@RequestParam("msgSecNo") String msgSecNo, @RequestParam("msgNo") int msgNo, 
							@RequestParam("currentPage") int currentPage, @RequestParam(value="msgRead", required=false) String msgRead, Model m) {
		ArrayList<Message> msgList = msgService.selectMsg(msgSecNo, msgRead, msgNo);
		ArrayList<BMsgFile> files = msgService.selectFile(msgNo);
		
		
		if(msgList != null && msgList.size() > 0) {
			String receiver = ""; 
			for(int i = 0; i < msgList.size(); i++) {
				Message message = msgList.get(i);
				if(i != msgList.size()-1) {
					receiver += message.getMsgReceiver() + ", ";					
				} else {
					receiver += message.getMsgReceiver();
				}
			}
			
			Message msg = msgList.get(0);
			msg.setMsgReceiver(receiver);
			
			m.addAttribute("msg", msg)
			 .addAttribute("files", files)
			 .addAttribute("currentPage", currentPage);
			return "messageDetail";
		} else {
			throw new MessageException("메세지 상세보기 실패");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
