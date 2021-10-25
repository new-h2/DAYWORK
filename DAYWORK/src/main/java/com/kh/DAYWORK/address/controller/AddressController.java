package com.kh.DAYWORK.address.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.DAYWORK.address.exception.AddressException;
import com.kh.DAYWORK.address.model.service.AddressService;
import com.kh.DAYWORK.address.model.vo.Address;
import com.kh.DAYWORK.address.model.vo.PageInfo;
import com.kh.DAYWORK.common.Pagination;
import com.kh.DAYWORK.member.model.vo.Member;

@Controller
public class AddressController {

	@Autowired
	private AddressService aService;

	@RequestMapping("addressInsertForm.ad")
	public String AddressInsertForm() {
		return "addressForm";
	}

	// 사외 주소록 등록
	@RequestMapping("insertAddress.ad")
	public String insertAddress(HttpSession session, @ModelAttribute Address a,
			@RequestParam("profil") MultipartFile uploadFile, HttpServletRequest request) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (uploadFile != null && !uploadFile.isEmpty()) {

			String renameFileName = saveFile(uploadFile, request);

			if (renameFileName != null) {
				a.setOriginalFileName(uploadFile.getOriginalFilename());
				a.setRenameFileName(renameFileName);
				a.setmNo(loginUser.getmNo());
			}
		}

		a.setmNo(loginUser.getmNo());

		int result = aService.insertAddress(a);

		if (result > 0) {
			return "redirect:address.ad";
		} else {
			throw new AddressException("주소록 등록에 실패하였습니다.");
		}
	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "/addUploadFiles";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러");
			e.printStackTrace();
		}

		return renameFileName;
	}

	// 주소록 상세 조회
	@RequestMapping("detailAddress.ad")
	public String detailAddress(@RequestParam(value = "aNo", required = false) Integer aNo,
			@RequestParam(value = "mNo", required = false) Integer mNo,
			@RequestParam(value = "code", required = false) Integer code, Model model) {

		if (code != null) {
			Member m = aService.detailMember(mNo);

			model.addAttribute("member", m);
			model.addAttribute("code", code);
		} else {
			Address a = aService.detailAddress(aNo);

			model.addAttribute("add", a);
		}

		return "addressDetail";
	}

	// 주소록 삭제
	@RequestMapping("deleteAddress.ad")
	public String deleteAddress(@RequestParam("checkedList") String checkedList) throws AddressException {

		String[] list = checkedList.split(",");
		int result = aService.deleteAddress(list);

		if (result != list.length) {
			throw new AddressException("연락처 삭제에 실패했습니다.");
		} else {
			return "redirect:address.ad";
		}
	}

	// 주소록 수정 페이지로 이동
	@RequestMapping("updateViewAddress.ad")
	public String updateViewAddress(@RequestParam("aNo") Integer aNo, Model model) {
		Address a = aService.detailAddress(aNo);

		model.addAttribute("add", a);

		return "addressUpdate";
	}

	// 주소록 수정
	@RequestMapping("updateAddress.ad")
	public ModelAndView updateAddress(@ModelAttribute Address a, @RequestParam("reloadFile") MultipartFile reloadFile,
			HttpServletRequest request, ModelAndView mv) {

		if (reloadFile != null && !reloadFile.isEmpty()) {

			if (a.getRenameFileName() != null) {
				deleteFile(request, a);
			}

			String renameFileName = saveFile(reloadFile, request);
			if (renameFileName != null) {
				a.setOriginalFileName(reloadFile.getOriginalFilename());
				a.setRenameFileName(renameFileName);
			}
		}

		int result = aService.updateAddress(a);

		if (result > 0) {
			Address add = aService.detailAddress(a.getaNo());
			mv.addObject("add", add);
			mv.setViewName("addressDetail");
		} else {
			throw new AddressException("주소록 수정에 실패하였습니다.");
		}

		return mv;
	}

	// 파일 삭제
	public void deleteFile(HttpServletRequest request, Address a) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\adduploadFiles";

		File f = new File(savePath + "\\" + a.getRenameFileName());
		if (f.exists()) {
			f.delete();
		}
	}

	// 주소록 리스트
	@RequestMapping("address.ad")
	public String searchAddress(HttpSession session, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "search", required = false) String key,
			@RequestParam(value = "code", required = false) Integer code,
			@RequestParam(value = "dept", required = false) String deptKey,
			@RequestParam(value = "job", required = false) String jobKey, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		HashMap map = new HashMap();
		map.put("key", key);
		map.put("mNo", loginUser.getmNo());

		int listCount = aService.getListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Address> list = aService.selectAddress(pi, map);

		if (code != null) {
			map.put("deptKey", deptKey);
			map.put("jobKey", jobKey);

			listCount = aService.getListCount2(map);
			pi = Pagination.getPageInfo(currentPage, listCount);
			list = aService.selectAddress2(pi, map);

			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("code", code);
			model.addAttribute("key", key);
			model.addAttribute("dept", deptKey);
			model.addAttribute("job", jobKey);

			return "addressList";
		}

		if (list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("key", key);

			return "addressList";
		} else {
			throw new AddressException("주소록 조회에 실패하였습니다.");
		}
	}

}
