package com.phoenix.bss;

import java.util.List;

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

@Controller
public class AdminController {
	
	@Autowired private AdminServiceImpl service;
	@Autowired private AdminPage page;
	
	//admin
	@RequestMapping("/admin")
	public String userList(Model model, HttpSession session, @RequestParam(defaultValue = "1")int curPage, @RequestParam(defaultValue = "20")int pageList, 
			@RequestParam(defaultValue = "id") String search,
			@RequestParam(defaultValue = "all") String keyword) {
	session.setAttribute("category", "ad");
	page.setCurPage(curPage);
	page.setSearch(search);
	page.setKeyword(keyword);
	page.setPageList(pageList);
	model.addAttribute("page", service.admin_user_list(page));
	
//	List<Admin_UserVO> list = service.admin_user_list();
//	model.addAttribute("list", list);
	//전체 회원 조회
		return "mypage/admin-list";
	}
	
	
	
	
//	@RequestMapping("/admin")
//	public String userList(Model model, HttpSession session) {
//		session.setAttribute("category", "ad");
//		List<Admin_UserVO> list =  service.admin_user_list();
//		model.addAttribute("list", list);
//		return "mypage/admin-list";
//	}
	
//	@RequestMapping("search.ad")
//	public String userSearch(String search, String keyword, Model model) {
//		page.setKeyword(keyword);
//		page.setSearch(search);
//		return "";
//	}
	
	@RequestMapping("/detail.ad")
	public String datailuser(Model model, String id) {
		Admin_UserVO vo = service.admin_user_detail(id);
		model.addAttribute("vo", vo);
		//특정 회원 조회
		return "mypage/detail_user";
	}

	@RequestMapping("/list.qu")
	public String questionList(Model model) {
		
		return "";
	}
	
	
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
}
