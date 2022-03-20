package com.phoenix.bss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	//로그인화면
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

}
