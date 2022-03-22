package com.phoenix.bss;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import user.UserDAO;
import user.UserVO;

@Controller
public class UserController {
	
	@Autowired UserDAO dao;
	
	//회원가입 화면 요청
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}
	
	//로그아웃 요청
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/";
	}
	
	//로그인 요청
	@ResponseBody
	@RequestMapping("/bssLogin")
	public boolean login(String id, String pw, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		UserVO vo = dao.user_login(map);
		session.setAttribute("loginInfo", vo);
		return vo == null? false : true;
	}
	
	//로그인 화면 요청
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

}
