package com.phoenix.bss;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	//관리자 - 회원 목록 화면 요청 
	@RequestMapping("/admin")
	public String userList(Model model ) {
	
		return "mypage/admin-list";
	}

	
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
}
