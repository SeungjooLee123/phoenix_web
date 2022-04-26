package com.phoenix.bss;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
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
	String a = "";
    
    @ResponseBody
    @RequestMapping("/music_check2")
    public void music_check2() {
    	//System.out.println("asaa");
       a = "";
    }
    //Cursor cursor = getContentResolver().query(selected, columns, null, null, null);
    @ResponseBody
    @RequestMapping("/music_check")
    public String music_check() {
		//System.out.println(a.substring(0,9)); 
        return  gson.toJson(a);
    }
    
    @ResponseBody
    @RequestMapping("/music")
    public void music(String musicfile) throws IOException {
    	//System.out.println("asd");
       a = musicfile;
//       System.out.println(musicfile.length());
//       byte[] base64data1 = Base64.getUrlDecoder().decode(musicfile);
//       
//       FileOutputStream fos;
//       File t = new File("C:\\aa\\asd.mp3");
//       t.createNewFile();
//      try {
//          fos = new FileOutputStream(t);
//          fos.write(base64data1);
//          fos.flush();
//          fos.close();
//          
//      }catch (Exception e) {
//         // TODO: handle exception
//         e.printStackTrace();
//      }
    }
 
	
	//회원가입 화면 요청
	@RequestMapping("/join")
	public String join(HttpSession session) {
		session.setAttribute("category", "join");
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
		System.out.println("--ss--ss-ss--ss--ss----");
		System.out.println(id);
		System.out.println(pw);
		return vo == null? false : true;
	}
	
	//로그인!!
	@ResponseBody
	@RequestMapping("/bssLoginn")
	public String loginn(String id, String pw) {
		System.out.println(id);
		System.out.println(pw);
		HashMap<String,  String > loginmap = new HashMap<String, String>();
		loginmap.put("id" , id);
		loginmap.put("pw" , pw);
		System.out.println(loginmap);
		UserVO loginvo = dao.user_loginn ( loginmap );
		System.out.println(loginvo.getId());
		try {
			return gson.toJson(loginvo);			
		} catch (NullPointerException e) {
			// TODO: handle exception
			System.out.println("nullpoint");
		}
		 return "";
		
	}
	

	
	//소셜로그인
	@ResponseBody
	@RequestMapping("/social_login.user")
	public String social_login(String id) {
		System.out.println("/social_login.user");
		
		
		return gson.toJson( dao.social_login(id) );
	}
	
	
	//로그인 화면 요청
	@RequestMapping("/login")
	public String login(HttpSession session) {
		session.setAttribute("category", "login");
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
