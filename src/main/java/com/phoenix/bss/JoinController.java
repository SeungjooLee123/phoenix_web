package com.phoenix.bss;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import babyinfo.BabyInfoVO;
import babyinfo.FamilyInfoVO;
import common.CommonService;
import join.JoinDAO;
import join.JoinServiceImpl;
import user.UserDAO;
import user.UserVO;

@Controller
public class JoinController {
	@Autowired private JoinServiceImpl service;
	@Autowired UserDAO userdao;
	@Autowired JoinDAO dao;
	@Autowired CommonService common;
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
	final String getLocalAddr = "121.148.239.238:5524";

	private String naver_client_id = "uR4I8FNC11hwqTB3Fr6l";
	
	@RequestMapping(value="/kakaoLogin", produces="text/html; charset=UTF-8")
	public String kakaoLogin() {
		StringBuffer url = new StringBuffer("https://kauth.kakao.com/oauth/authorize?response_type=code");
		url.append("&client_id=").append("4b12573ac9cb8199a62e031d7c2e1808");
		url.append("&redirect_uri=").append("http://localhost/bss/kakaocallback");
		
//		System.out.println("code = "+code);
//		
//		String access_Token = common.getAccessToken(code);
//		System.out.println("###access_Token#### : " + access_Token);
		
		return "redirect:" + url.toString(); //????????? ????????? url??? ????????????
	}
	
	@RequestMapping(value = "/kakaocallback", produces="text/html; charset=UTF-8")
	public String kakaocallback(@RequestParam(value = "code", required = false) String code, @RequestParam(required = false) String error, HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		if(error != null) {//?????? ?????? ????????? ???
			return "redirect:/";
		}
		System.out.println("#########" + code);
        String access_Token = common.getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        
        
        UserVO vo = getUserInfo(access_Token);
//        System.out.println("###access_Token#### : " + access_Token);
//        System.out.println("###userInfo#### : " + vo.getId());
        if(vo != null) {
        	if(service.id_check(vo.getId())) {
    			service.member_join(vo);
    			rttr.addFlashAttribute("isjoin", "yes");
    		}
			vo.setAdmin("N");
			
			session.setAttribute("loginInfo", vo);
        	UserVO vo1 = (UserVO) session.getAttribute("loginInfo");
        	System.out.println(vo1.getId());
        	
        }else {
        	System.out.println("null??? ?????????");
        }
        return "redirect:/";
	}
	
	public UserVO getUserInfo (String access_Token) {

        //    ???????????? ????????????????????? ?????? ????????? ?????? ??? ????????? HashMap???????????? ??????
		UserVO vo = new UserVO();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    ????????? ????????? Header??? ????????? ??????
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

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

            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            boolean agree = kakao_account.getAsJsonObject().get("email_needs_agreement").getAsBoolean();
            String email = null;
            if(!agree) {
            	email = kakao_account.getAsJsonObject().get("email").getAsString();            	
            	vo.setKakao_id("Y");
            	vo.setId(email);
            	return vo;
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
	
	@RequestMapping(value="/naverLogin", produces="text/html; charset=UTF-8")
	public String naverLogin(HttpSession session) {
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);
		
		StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/authorize?response_type=code");
		url.append("&client_id=").append(naver_client_id);
		url.append("&state=").append(state);
		url.append("&redirect_uri=").append("http://localhost/bss/navercallback");
		
		return "redirect:" + url.toString(); //????????? ????????? url??? ????????????
	}
	
	@RequestMapping(value="/navercallback", produces="text/html; charset=UTF-8")
	public String navercallback(@RequestParam(required = false) String code, String state, @RequestParam(required = false) String error, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
		if(! state.equals(session.getAttribute("state")) || error != null) {//?????? ?????? ????????? ???
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
		
		
		url = new StringBuffer("https://openapi.naver.com/v1/nid/me");		// => ?????? ??????
		json = new JSONObject(common.requestAPI(url, type + " " + token));			//type??? token ????????? ????????? ??? ??? ?????????
		
		if(json.getString("resultcode").equals("00")) {
			json = json.getJSONObject("response");
			UserVO vo = new UserVO();
			vo.setId(json.getString("email"));
			vo.setNaver_id("Y");
			vo.setAdmin("N");
			
			session.setAttribute("loginInfo", vo);
			
			System.out.println(gson.toJson(vo));
			if(service.id_check(vo.getId())) {
				service.member_join(vo);
				rttr.addFlashAttribute("isjoin", "yes");
			}
		}	
		return "redirect:/"	;//????????? ????????? ?????? ????????? ??????
	}
	
	//=========================================================================================================
	

	//???????????? ?????? ??????
	@ResponseBody
	@RequestMapping(value = "/member_insert.bss", produces="text/html; charset=UTF-8")
	public String member_insert(UserVO vo, HttpServletRequest req, HttpSession session) {
		StringBuffer msg = new StringBuffer("<script>");
		if(!service.member_join(vo)) {
			msg.append("alert('???????????? ??????');").append("location='member';");
		}else {
			msg.append("alert('??????????????? ??????????????????.');").append("location='").append(req.getContextPath()).append("';");
		}
		msg.append("</script>");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", vo.getId());
		map.put("pw", vo.getPw());
		session.setAttribute("loginInfo", userdao.user_login(map));
		return msg.toString();
	}

	//????????? ????????????
	@ResponseBody
	@RequestMapping("/id_check.bss")
	public boolean id_cheack(String id) {
		return service.id_check(id);
	}
	
	
	//android==========================================================================
	
	//kakao ??????
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
	//????????? or ????????? -> ????????? ????????? -> db??? user table??? ?????? ????????? ????????? ??????
	//????????? ???????????? ??????
	
	//????????? ??? ????????? ????????? ????????? -> ?????? ????????? 
	
	
	
	//Title ????????????
	@ResponseBody
	@RequestMapping ( value = "/title_check.join", produces="application/json;charset=UTF-8")
	public String title_check(String title) throws IOException {
		Gson gson = new Gson();
		System.out.println(title);
		String rtn =  gson.toJson( dao.title_check(title) );
		return rtn;
	}
	
	
	//ID ????????????
	@ResponseBody
	@RequestMapping ( value = "/id_check.join", produces="application/json;charset=UTF-8")
	public String id_check(String id) throws IOException {
		Gson gson = new Gson();
		System.out.println(id);
		String rtn =  gson.toJson( dao.id_check(id) );
		return rtn;
	}
	
	
	//????????????
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
		System.out.println("invite_login ??????");
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