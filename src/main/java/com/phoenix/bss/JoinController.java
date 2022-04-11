package com.phoenix.bss;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import babyinfo.FamilyInfoVO;
import common.CommonService;
import join.JoinDAO;
import user.UserVO;

@Controller
public class JoinController {
	@Autowired JoinDAO dao;
	@Autowired CommonService common;
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
	final String getLocalAddr = "121.148.239.238:5524";
	UserVO vo = new UserVO();

	
	//kakao 로그인
	@ResponseBody
	@RequestMapping(value = "/kakaoLoginn" , produces="application/json;charset=UTF-8" )
	public String kakaoLogin(HttpServletRequest req , HttpServletResponse res) {
		String id = req.getParameter("id");
		System.out.println(id);
		/*
		 * System.out.println(email); System.out.println(name); vo.setId( email );
		 */
		
		
		return gson.toJson(id);
	}
	
	
	//Title 중복확인
	@ResponseBody
	@RequestMapping ( value = "/title_check.join", produces="application/json;charset=UTF-8")
	public String title_check(String title) throws IOException {
		Gson gson = new Gson();
		System.out.println(title);
		String rtn =  gson.toJson( dao.title_check(title) );
		return rtn;
	}
	
	
	//ID 중복확인
	@ResponseBody
	@RequestMapping ( value = "/id_check.join", produces="application/json;charset=UTF-8")
	public String id_check(String id) throws IOException {
		Gson gson = new Gson();
		System.out.println(id);
		String rtn =  gson.toJson( dao.id_check(id) );
		return rtn;
	}
	
	
	//회원가입
	@ResponseBody
	@RequestMapping ( value = "/user.join", produces="application/json;charset=UTF-8")
	public String userJoin (String vo , String vo2 , HttpServletRequest req , HttpSession session) {
		UserVO userInfo = gson.fromJson(vo, UserVO.class);
		boolean insertchk = dao.userJoin(userInfo);
		boolean result = false; 
		
		BabyInfoVO babyInfoVO = gson.fromJson(vo2, BabyInfoVO.class);
		MultipartRequest mulReq = (MultipartRequest) req;
		MultipartFile file = mulReq.getFile("file");
		
		//babyInfoVO.setBaby_id(uuid);
		
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
					System.out.println(server_path);
				}
				
			}else {
				gson.toJson( dao.babyJoin(babyInfoVO) );
			}
		//}
		
		
		/*
		  System.out.println(babyInfoVO.getTitle());
		  System.out.println(userInfo.getFamily_rels());
		  System.out.println(babyInfoVO.getBaby_birth() );
		  System.out.println(babyInfoVO.getBaby_name() );
		  System.out.println(babyInfoVO.getBaby_gender() );
		  System.out.println(babyInfoVO.getBaby_photo() );
		  System.out.println(babyInfoVO.getId() );
		  System.out.println(babyInfoVO.getTitle() ); System.out.println("ddd: " +
		  file); String aa= "";
		 */
	
		
		//return "";
		
		return gson.toJson( insertchk );
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/invite_login.join", produces = "application/json;charset=UTF-8")
	public String invite_login(String vo) {
		System.out.println("invite_login 접근");
		FamilyInfoVO familyInfoVO = gson.fromJson(vo, FamilyInfoVO.class);
		return gson.toJson(dao.invite_login(familyInfoVO));
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert_new.join", produces = "application/json;charset=UTF-8")
	public String insert_new(String familyvo, String babyvo) {
		System.out.println(familyvo);
		System.out.println(babyvo);
		if(dao.invite_login(gson.fromJson(familyvo, FamilyInfoVO.class))) {
			
			BabyInfoVO vo = gson.fromJson(babyvo, BabyInfoVO.class);
			
			if(dao.babyJoin(vo)) {
				return gson.toJson(true);
			}
			return gson.toJson(false);
		}
		return gson.toJson(false);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert_baby.join", produces = "application/json;charset=UTF-8")
	public String insert_baby(String vo) {
		System.out.println(vo);
		String uuid = UUID.randomUUID().toString();
		BabyInfoVO babyvo = gson.fromJson(vo, BabyInfoVO.class);
		babyvo.setBaby_id(uuid);
		if(dao.babyJoin(babyvo)) {
			return gson.toJson(true);
		}
		return gson.toJson(false);
	}
	
	
}