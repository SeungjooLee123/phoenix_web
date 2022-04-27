package com.phoenix.bss;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.AdminPage;
import admin.AdminServiceImpl;
import admin.Admin_UserVO;
import common.CommonService;
import customer.CustomerVO;
import user.UserVO;

@Controller
public class AdminController {
	
	@Autowired private AdminServiceImpl service;
	@Autowired private AdminPage page;
	@Autowired private CommonService common;
	
	//admin
//	@RequestMapping("/admin")
//	public String userList(Model model, HttpSession session, @RequestParam(defaultValue = "1")int curPage, @RequestParam(defaultValue = "20")int pageList, 
//			@RequestParam(defaultValue = "id") String search,
//			@RequestParam(defaultValue = "all") String keyword) {
//	session.setAttribute("category", "ad");
//	page.setCurPage(curPage);
//	page.setSearch(search);
//	page.setKeyword(keyword);
//	page.setPageList(pageList);
//	model.addAttribute("page", service.admin_user_list(page));
//	
////	List<Admin_UserVO> list = service.admin_user_list();
////	model.addAttribute("list", list);
//	//전체 회원 조회
//		return "mypage/admin-list";
//	}
	
	//(카테고리별) 문의사항 화면 요청
	@RequestMapping("/admin")
	public String questionList(Model model, HttpSession session, String category) {
		session.setAttribute("category", "ad");
		category = category == null ? "normal" : category;
		List<CustomerVO> list = service.customer_list(category);
		model.addAttribute("list", list);
		return "mypage/question-list";
	}
	
	//문의 사항 디테일 요청
	@RequestMapping("/detail.ad")
	public String datailuser(Model model, String title) {
		CustomerVO vo = service.admin_qanda_detail(title);
		model.addAttribute("vo", vo);
		return "mypage/detail_qanda";
	}
	
	//문의사항 첨부파일 다운로드 요청
	@RequestMapping("/download.bo")
	public void download(int id, HttpSession session, HttpServletResponse req) {
		CustomerVO vo = service.admin_file(id);
		common.fileDownload(vo.getFilename(), vo.getFilepath(), session, req);
	}
	
	//해당 문의사항 글 조회 후 답변 처리 
	@RequestMapping("/replyre")
	public String replyre(CustomerVO vo, String reply, int id) {
		CustomerVO testvo = service.admin_customer_detail(id);
		testvo.setReply(reply);
		service.admin_reply(testvo);
		return "redirect:admin";
	}
	
	
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession session, String user_id) {
		session.setAttribute("category", "us");
		user_id =  ((UserVO)session.getAttribute("loginInfo")).getId();
	
		List<CustomerVO> list = service.user_cs_list(user_id);
		model.addAttribute("list", list);
		return "mypage/mypage";
	}
	
	@RequestMapping("/my_detail")
	public String my_detail(Model model, int id) {
		CustomerVO vo = service.admin_reply_detail(id);
		//여기서 널 
		model.addAttribute("vo", vo);
		String test = "";
		return "mypage/my_detail";
	}
	
}
