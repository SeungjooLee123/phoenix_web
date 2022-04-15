package com.phoenix.bss;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import babyinfo.BabyInfoVO;
import babyinfo.FamilyInfoVO;
import common.CommonService;
import diary.DiaryVO;
import join.JoinDAO;
import join.JoinServiceImpl;
import user.UserVO;

@Controller
public class JoinController {
	@Autowired private JoinServiceImpl service;
	@Autowired JoinDAO dao;
	@Autowired CommonService common;
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
	final String getLocalAddr = "121.148.239.238:5524";

	private String naver_client_id = "uR4I8FNC11hwqTB3Fr6l";
	
	
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin() {
		StringBuffer url = new StringBuffer("https://kauth.kakao.com/oauth/authorize?response_type=code");
		url.append("&client_id=").append("4b12573ac9cb8199a62e031d7c2e1808");
		url.append("&redirect_uri=").append("http://localhost/bss/kakaocallback");
		
//		System.out.println("code = "+code);
//		
//		String access_Token = common.getAccessToken(code);
//		System.out.println("###access_Token#### : " + access_Token);
		
		return "redirect:/ + url.toString()"; //위에서 설정한 url로 이동시킴
	}
	@RequestMapping("/kakaocallback")
	public String kakaocallback(@RequestParam(required = false) String code, @RequestParam(required = false) String error, HttpSession session) {
		if(error != null) {//토큰 발급 불가일 때
			return "redirect:/";
		}
		UserVO vo;
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer "  /*access_Token*/);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/naverLogin")
	public String naverLogin(HttpSession session) {
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);
		
		StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/authorize?response_type=code");
		url.append("&client_id=").append(naver_client_id);
		url.append("&state=").append(state);
		url.append("&redirect_uri=").append("http://localhost/bss/navercallback");
		
		return "redirect:" + url.toString(); //위에서 설정한 url로 이동시킴
	}
	
	@RequestMapping("/navercallback")
	public String navercallback(@RequestParam(required = false) String code, String state, @RequestParam(required = false) String error, HttpSession session) {
		if(! state.equals(session.getAttribute("state")) || error != null) {//토큰 발급 불가일 때
			return "redirect:/";
		}
		
		StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code");
		url.append("&client_id=").append(naver_client_id);
		url.append("&client_secret=").append("U3LRpxH6Tq");
		url.append("&code=").append(code);
		url.append("&state=").append(state);
		
		JSONObject json = new JSONObject(common.requestAPI(url));
		
		String token = json.getString("access_token");
		String type = json.getString("token_type");
		
		
		url = new StringBuffer("https://openapi.naver.com/v1/nid/me");		// => 예시 첫줄
		json = new JSONObject(common.requestAPI(url, type + " " + token));			//type과 token 사이에 무조건 한 칸 띄우기
		
		
		if(json.getString("resultcode").equals("00")) {
			json = json.getJSONObject("response");
			UserVO vo = new UserVO();
			vo.setId(json.getString("email"));
			vo.setNaver_id("Y");
			
			session.setAttribute("loginInfo", vo);
			
			System.out.println(gson.toJson(vo));
			if(service.id_check(vo.getId())) {
				System.out.println(gson.toJson(vo)+"if");
				service.member_join(vo);
			}
		}	
		return "redirect:/";	//로그인 처리가 되며 홈으로 이동
	}
	
	//=========================================================================================================
	

	//회원가입 처리 요청
	@ResponseBody
	@RequestMapping(value = "/member_insert.bss", produces="text/html; charset=UTF-8")
	public String member_insert(UserVO vo, HttpServletRequest req, HttpSession session) {
		StringBuffer msg = new StringBuffer("<script>");
		if(!service.member_join(vo)) {
			msg.append("alert('회원가입 실패');").append("location='member';");
		}else {
			msg.append("alert('회원가입을 축하드립니다.');").append("location='").append(req.getContextPath()).append("';");
		}
		msg.append("</script>");
		session.setAttribute("loginInfo", vo);
		return msg.toString();
	}

	//아이디 중복확인
	@ResponseBody
	@RequestMapping("/id_check.bss")
	public boolean id_cheack(String id) {
		return service.id_check(id);
	}
	
	
	//android==========================================================================
	
	//kakao 가입
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
	//카카오 or 네이버 -> 이메일 받아옴 -> db에 user table에 해당 컬럼에 있는지 확인
	//없으면 가입으로 던짐
	
	//있으면 그 정보로 타이틀 만들기 -> 아기 만들기 
	
	
	
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
				System.out.println("----------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------");
				System.out.println(file.getOriginalFilename());
				String path = common.fileUpload("profile", file, session);
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
	
	@ResponseBody
	@RequestMapping(value =  "/family_selectid.join", produces="application/json;charset=UTF-8" )
	public String family_selectid(String vo) {
		FamilyInfoVO family_vo = gson.fromJson(vo, FamilyInfoVO.class);
		
		return gson.toJson(dao.family_selectid(family_vo));
	}
}