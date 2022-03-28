package com.phoenix.bss;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import join.JoinDAO;
import user.UserVO;

@Controller
public class JoinController {
	@Autowired JoinDAO dao;
	
	
	//ID 중복확인
	@ResponseBody
	@RequestMapping ( value = "/id_check.join", produces="application/json;charset=UTF-8")
	public String id_check(String id) throws IOException {
		Gson gson = new Gson();
		System.out.println(id);
		return gson.toJson( dao.id_check(id) );
	}
	
	
	//회원가입처리
	@ResponseBody
	@RequestMapping ( value = "/user.join", produces="application/json;charset=UTF-8")
	public String userJoin (String vo) {
		Gson gson = new Gson();
		UserVO userInfo = gson.fromJson(vo, UserVO.class);
		System.out.println(userInfo.getFamily_rels());
		return gson.toJson( dao.userJoin(userInfo) );
		
		//return gson.toJson( dao.userJoin(vo) );
	}
	
	
	
	
	
	
}
