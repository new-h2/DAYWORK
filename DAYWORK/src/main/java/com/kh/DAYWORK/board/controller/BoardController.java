package com.kh.DAYWORK.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

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
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.DAYWORK.board.model.exception.BoardException;
import com.kh.DAYWORK.board.model.service.BoardService;
import com.kh.DAYWORK.board.model.vo.Board;
import com.kh.DAYWORK.board.model.vo.Reply;
import com.kh.DAYWORK.chat.model.vo.ChatMessage;
import com.kh.DAYWORK.chat.model.vo.ChatRoom;
import com.kh.DAYWORK.common.BMsgFile;
import com.kh.DAYWORK.member.model.service.MemberService;
import com.kh.DAYWORK.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	@Autowired
	private MemberService mService;
	

	@RequestMapping("boardList.bo")
	public String boardList(@RequestParam(value="page", required=false) Integer page,  Model m) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("currentPage", (currentPage-1) * 10 + "");
		map.put("bTopFixed", "N");
		
		int listCount = bService.getListCount();
		ArrayList<Board> bList = bService.selectBList(map);
		map.put("bTopFixed", "Y");
		ArrayList<Board> bListTop = bService.selectBList(map);
		
		
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
		
		ArrayList<Board> bList2 = newBoard(bList);
		ArrayList<Board> bListTop2 = newBoard(bListTop);
        
		if(bList != null) {
			m.addAttribute("bList2", bList2)
			.addAttribute("bListTop2", bListTop2)
			.addAttribute("maxPage", maxPage)
			.addAttribute("startPage", startPage)
			.addAttribute("endPage", endPage)
			.addAttribute("currentPage", currentPage);
			return "board";
		} else {
			throw new BoardException("없는 페이지 입니다.");
		}
		
	}
	
	@RequestMapping("goBoardWrite.bo")
	public String boardWrite() {
		return "boardWrite";
	}
	
	@RequestMapping("binsert.bo")
	@ResponseBody
	public String insertBoard(@ModelAttribute Board b, @RequestParam(value="uploadFiles", required=false) List<MultipartFile> files, 
							  HttpServletRequest request, HttpSession session, @RequestParam(value="deleteFiles", required=false) int[] deleteFiles) {
		
		ArrayList<BMsgFile> fileList = new ArrayList<BMsgFile>();
		
		if(files != null && files.size() > 0) {
			if(deleteFiles != null) {
				for(int i = 0; i < deleteFiles.length; i++) {
					files.remove(deleteFiles[i]);
				}				
			}
			
			for(MultipartFile file : files) {
				String renameFileName = saveFile(file, request, "/buploadFiles");
				
				if(renameFileName != null) {
					BMsgFile f = new BMsgFile();
					f.setfOrigin(file.getOriginalFilename());
					f.setfRename(renameFileName);
					
					fileList.add(f);
				}
			}
		}
		
		int mNo = ((Member)session.getAttribute("loginUser")).getmNo();
		b.setbMNo(mNo);
		
		int result = bService.insertBoard(b, fileList);
		if(result > 0) {
			return "success";
		} else {
			deleteFile(request, fileList, "/buploadFiles");
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request, String path) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + path;
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmsssss");
		String originalFileName = file.getOriginalFilename();
		int ranNum = (int)(Math.random() * 10000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
								+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "/" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러");
			e.printStackTrace();
		} 
		
		return renameFileName;
	}
	
	public void deleteFile(HttpServletRequest request, ArrayList<BMsgFile> files, String path) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + path;
		
		for(BMsgFile f : files) {
			File file = new File(savePath + "/" + f.getfRename());
			if(file.exists()) {
				file.delete();
			}			
		}
	}
	
	@RequestMapping("bdetail.bo")
	public String selectBoard(@RequestParam("bNo") int bNo, @RequestParam("currentPage") int currentPage, Model m, HttpServletResponse response) {
		Board b = bService.selectBoard(bNo, true);
		ArrayList<BMsgFile> files = bService.selectFile(bNo);
		ArrayList<Reply> r = bService.selectRList(bNo);
		
		GsonBuilder gb = new GsonBuilder().setDateFormat("MM-dd");
		Gson gson  = gb.create();
		response.setContentType("application/json; charset=UTF-8");
		
		if(b != null) {
			int mNo = b.getbMNo();
			Member member = mService.selectMember(mNo);
			if(member != null) {
				m.addAttribute("b", b)
				 .addAttribute("files", files)
				 .addAttribute("currentPage", currentPage)
				 .addAttribute("member", member)
				 .addAttribute("r", gson.toJson(r));
				return "boardDetail";				
			} else {
				throw new BoardException("게시글 상세보기 실패");
			}
		} else {
			throw new BoardException("게시글 상세보기 실패");
		}
		
	}
	
	@RequestMapping("goBoardUpdate.bo")
	public String goBoardUpdate(@RequestParam("bNo") int bNo, @RequestParam("currentPage") int currentPage, Model m) {
		Board b = bService.selectBoard(bNo, false);
		ArrayList<BMsgFile> files = bService.selectFile(bNo);
		m.addAttribute("b", b).addAttribute("currentPage", currentPage).addAttribute("files", files);
		return "boardUpdate";
	}
	
	@RequestMapping("bUpdate.bo")
	public void updateBoard(@ModelAttribute Board b, @RequestParam(value="uploadFiles", required=false) List<MultipartFile> files, 
				 		    HttpServletRequest request, HttpSession session, @RequestParam(value="beforeFile", required=false) String[] beforeFile,
				 		    HttpServletResponse response, @RequestParam("currentPage") int currentPage, @RequestParam(value="deleteFiles", required=false) String[] deleteFiles,
				 		    @RequestParam(value="addedDeleteFiles", required=false) String[] addedDeleteFiles) {

		ArrayList<BMsgFile> fileList = new ArrayList<BMsgFile>();
		
//		System.out.println(addedDeleteFiles.length);
//		System.out.println(files.get(0));
		
		if(files != null && files.size() > 0) {
//			if(addedDeleteFiles != null) {
//				for(int i = 0; i < addedDeleteFiles.length; i++) {
//					files.remove(addedDeleteFiles[i]);
//				}				
//			}
			
			for(MultipartFile file : files) {
				if(addedDeleteFiles != null) {
					boolean check = false;
					for(int i = 0; i < addedDeleteFiles.length; i++) {
						if(file.getOriginalFilename().equals(addedDeleteFiles[i])) {
							check = true;
							break;
						}
					}	
					if(check == true) {
						continue;						
					}
				}
				
				String renameFileName = saveFile(file, request, "/buploadFiles");

				if(renameFileName != null) {
					BMsgFile f = new BMsgFile();
					f.setfOrigin(file.getOriginalFilename());
					f.setfRename(renameFileName);
					f.setfBNo(b.getbNo());
					fileList.add(f);
				}
			}
		}
		
		int result = bService.updateBoard(b, fileList, beforeFile);
		
		if(deleteFiles != null && deleteFiles.length > 0) {
			ArrayList<BMsgFile> deleteList = new ArrayList<BMsgFile>();
			for(String d : deleteFiles) {
				BMsgFile bmsg = new BMsgFile();
				bmsg.setfRename(d);
				deleteList.add(bmsg);
			}
			deleteFile(request, deleteList, "/buploadFiles");
			bService.deleteFile(deleteFiles);
		}
		
		if(result > 0) {
			
			if(beforeFile != null && beforeFile.length > 0) {
				ArrayList<BMsgFile> beforeList = new ArrayList<BMsgFile>();

				for(String rename : beforeFile) {
					BMsgFile file = new BMsgFile();
					file.setfRename(rename);
					beforeList.add(file);
				}
				deleteFile(request, beforeList, "/buploadFiles");
			}
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("bNo", b.getbNo());
			map.put("currentPage", currentPage);
			
			Gson gson = new Gson();
			response.setContentType("application/json; charset=UTF-8");
			try {
				gson.toJson(map, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			deleteFile(request, fileList, "/buploadFiles");
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("searchBoardList.bo")
	public String searchBoardList(@RequestParam(value="page", required=false) Integer page,  Model m, @RequestParam String type, @RequestParam String search) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("search", search);
		map.put("currentPage", ((currentPage-1) * 10) + "");
		map.put("bTopFixed", "Y");
		
		
		int listCount = bService.searchBListCount(map);
		ArrayList<Board> bList = bService.searchBList(map);
//		map.put("bTopFixed", "Y");
		ArrayList<Board> bListTop = bService.selectBList(map);
		
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
		
		ArrayList<Board> bList2 = newBoard(bList);
		ArrayList<Board> bListTop2 = newBoard(bListTop);
		
		if(bList != null) {
			m.addAttribute("bList2", bList2)
			.addAttribute("bListTop2", bListTop2)
			.addAttribute("maxPage", maxPage)
			.addAttribute("startPage", startPage)
			.addAttribute("endPage", endPage)
			.addAttribute("currentPage", currentPage);
			return "board";
		} else {
			throw new BoardException("없는 페이지 입니다.");
		}
		
	}
	
	@RequestMapping("bDelete.bo")
	public String goBoardUpdate(@RequestParam("bNo") int bNo, HttpServletRequest request, @RequestParam(value="files", required=false) String[] files) {
		int result = bService.deleteBoard(bNo);
		
		ArrayList<BMsgFile> deleteList = new ArrayList<BMsgFile>();
		for(String d : files) {
			BMsgFile bmsg = new BMsgFile();
			bmsg.setfRename(d);
			deleteList.add(bmsg);
		}
		
		if(result > 0) {
			deleteFile(request, deleteList, "/buploadFiles");
			return "redirect:boardList.bo";			
		} else {
			throw new BoardException("삭제에 실패하였습니다.");	
		}
	}
	
	@RequestMapping("insertReply.bo")
	@ResponseBody
	public void insertReply(@RequestParam("bNo") int bNo, 
						    @RequestParam("content") String content, HttpServletResponse response, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Reply reply = new Reply();
		reply.setrMNo(loginUser.getmNo());
		reply.setrMRenameProfile(loginUser.getmRenameProfile());
		reply.setrBNo(bNo);
		reply.setrContent(content);
		
		ArrayList<Reply> r = bService.insertReply(reply);
		
		GsonBuilder gb = new GsonBuilder().setDateFormat("MM-dd");
		Gson gson  = gb.create();
		response.setContentType("application/json; charset=UTF-8");
		
		if(r != null) {
			try {
				gson.toJson(r, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<Board> newBoard(ArrayList<Board> bList) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		
		calendar.add(calendar.DATE, -7);
		String year = calendar.get(Calendar.YEAR) + "";
		String month = calendar.get(Calendar.MONTH) + 1 + "";
		String day = calendar.get(Calendar.DATE) + "";
		String today = year + "-" + month + "-" + day;
		
		ArrayList<Board> bList2 = new ArrayList<Board>(); 
		for(Board b : bList) {
			Date boardDate = b.getbCreateDate();			
			String boardDay = dateFormat.format(boardDate);
			int result = 1;
			try {
				Date boardDate2 = dateFormat.parse(boardDay);
				Date date = dateFormat.parse(today);
				
				result = boardDate2.compareTo(date);
				if(result == 0) result = 1;
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			b.setBoardNew(result);
			bList2.add(b);
		}
		
		return bList2;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
