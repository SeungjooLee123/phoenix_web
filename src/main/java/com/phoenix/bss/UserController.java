package com.phoenix.bss;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import diary.DiaryVO;
import user.UserDAO;
import user.UserVO;

@Controller
public class UserController {
	
	@Autowired UserDAO dao;
	Gson gson = new Gson();
	
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
	
	//가족 타이틀 리스트
	@ResponseBody
	@RequestMapping(value = "/titlelist.us", produces = "application/json;charset=UTF-8")
	public String babyinfo_title_list(HttpServletRequest req) throws IOException{
		System.out.println("titlelist접근");
		String id = req.getParameter("id");
		return gson.toJson(dao.baby_info_title_list(id));
	}
	
	//유저 회원가입 요청
	
	@ResponseBody
	@RequestMapping(value = "/user_join.us", produces = "application/json;charset=UTF-8")
	public String user_join(String vo){
		System.out.println("user_join접근");
		
		return gson.toJson(dao.user_join(gson.fromJson(vo, UserVO.class)));
	}

}
