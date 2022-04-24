package com.phoenix.bss;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.AdminServiceImpl;
import admin.Admin_UserVO;

@Controller
public class AdminController {
	
	@Autowired private AdminServiceImpl service;
	
	//admin
	@RequestMapping("/admin")
	public String userList(Model model, HttpSession session ) {
	session.setAttribute("category", "ad");
	List<Admin_UserVO> list = service.admin_user_list();
	model.addAttribute("list", list);
	//전체 회원 조회
		return "mypage/admin-list";
	}
	
	@RequestMapping("/detail.ad")
	public String datailuser(Model model, String id) {
		Admin_UserVO vo = service.admin_user_detail(id);
		model.addAttribute("vo", vo);
		//특정 회원 조회
		return "mypage/detail_user";
	}

	
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
}
