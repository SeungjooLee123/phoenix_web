package com.phoenix.bss;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import babyinfo.BabyInfoVO;
import common.CommonService;
import join.JoinDAO;
import user.UserVO;

@Controller
public class JoinController {
	@Autowired JoinDAO dao;
	@Autowired CommonService common;
	final String getLocalAddr = "121.148.239.238:5524";
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
	
	//ID 중복확인
	@ResponseBody
	@RequestMapping ( value = "/id_check.join", produces="application/json;charset=UTF-8")
	public String id_check(String id) throws IOException {
		System.out.println("ㅇㄹㅇㄹ");
		Gson gson = new Gson();
		System.out.println(id);
		String rtn =  gson.toJson( dao.id_check(id) );
		return rtn;
	}
	
	
	//회원가입처
	@ResponseBody
	@RequestMapping ( value = "/user.join", produces="application/json;charset=UTF-8")
	public String userJoin (String vo , String vo2 , HttpServletRequest req , HttpSession session) {
		UserVO userInfo = gson.fromJson(vo, UserVO.class);
		boolean insertchk = dao.userJoin(userInfo);
		boolean result = false; 
		
		BabyInfoVO babyInfoVO = gson.fromJson(vo2, BabyInfoVO.class);
		MultipartRequest mulReq = (MultipartRequest) req;
		MultipartFile file = mulReq.getFile("file");
		
		//if( dao.userJoin(userInfo) ) {
			if(file != null) {
				System.out.println(file.getOriginalFilename());
				String path = common.fileUpload("join", file, session);
				String server_path = "http://" + getLocalAddr + req.getContextPath() + "/resources/";
				//baby.setBaby_photo(server_path + path);
				
				babyInfoVO.setBaby_photo(server_path + path	);
				if( insertchk ) {
					gson.toJson( dao.babyJoin(babyInfoVO) );
					System.out.println("--------------------------");
				}
				
			}else {
				gson.toJson( dao.babyJoin(babyInfoVO) );
			}
				
			
			
		//}
		
		/*
		 * System.out.println(babyInfoVO.getTitle());
		 * System.out.println(userInfo.getFamily_rels());
		 * System.out.println(babyInfoVO.getBaby_birth() );
		 * System.out.println(babyInfoVO.getBaby_name() );
		 * System.out.println(babyInfoVO.getBaby_gender() );
		 * System.out.println(babyInfoVO.getBaby_photo() );
		 * System.out.println(babyInfoVO.getId() );
		 * System.out.println(babyInfoVO.getTitle() ); System.out.println("ddd: " +
		 * file); String aa= "";
		 */
		
		//return "";
		
		
		return gson.toJson( insertchk );
	}
	
	
	
	
	
	
}
