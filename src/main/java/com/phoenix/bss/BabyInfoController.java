package com.phoenix.bss;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

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

import babyinfo.BabyInfoDAO;
import babyinfo.BabyInfoVO;
import babyinfo.FamilyInfoVO;
import common.CommonService;

@Controller
public class BabyInfoController {
	@Autowired BabyInfoDAO dao;
	@Autowired private CommonService common;
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
	final String getLocalAddr = "121.148.239.238:5524";
	
	@ResponseBody
	@RequestMapping(value = "/list.bif", produces="application/json;charset=UTF-8")
	public String babyinfo_list(String id) throws IOException { //아기 리스트 불러오기
		System.out.println(id);
		List<BabyInfoVO> list = dao.baby_info_list(id);
		String data = gson.toJson(list);
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/rels.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_rels(String id, String baby_id) throws IOException{ //해당 아기에 대한 자신과의 관계
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("baby_id", baby_id);
		String rels = gson.toJson(dao.baby_info_rels(map));
		return rels;
	}
	
	@ResponseBody
	@RequestMapping(value = "/chTitle.bif", produces = "application/json;charset=UTF-8")
	public void babyinfo_title_change(String title, String baby_id) throws IOException{ //육아일기 타이틀 변경
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("baby_id", baby_id);
		dao.baby_info_title_change(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/coparent.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_coparent(String baby_id) throws IOException{ //해당 아기를 공동육아하는 사람 리스트
		List<FamilyInfoVO> coparent = dao.baby_info_co_parent(baby_id);
		return gson.toJson(coparent);
	}
	
	@ResponseBody
	@RequestMapping(value = "/updatebaby.bif", produces = "application/json;charset=UTF-8")
	public boolean babyinfo_update(String vo, String family, HttpServletRequest req, HttpSession session) throws IOException { //아기 정보 수정
		BabyInfoVO baby = gson.fromJson(vo, BabyInfoVO.class);
		MultipartRequest mulReq = (MultipartRequest) req;
		MultipartFile file = mulReq.getFile("file");
		if(file != null) {
			System.out.println(file.getOriginalFilename());
			String path = common.fileUpload("profile", file, session);
			String server_path = "http://" + getLocalAddr + req.getContextPath() + "/resources/";
			baby.setBaby_photo(server_path + path);
		}
		return dao.baby_info_update(baby) || dao.baby_info_rels_update(gson.fromJson(family, FamilyInfoVO.class));
	}
	

	@ResponseBody
	@RequestMapping(value = "/babydel.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_delete(String baby_id, String title) { //아기 삭제
		boolean result = dao.baby_info_delete(baby_id);
		if(dao.baby_info_count(title)) { //육아일기에 아기 없음
			dao.delete_title(title);
		}
		return gson.toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/countbaby.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_count(String title) { //한 육아일기에 있는 아기 숫자
		return gson.toJson(dao.baby_info_count(title));
	}
	
	@ResponseBody
	@RequestMapping(value = "/exit.family", produces = "application/json;charset=UTF-8")
	public String family_exit(String title, String id, String baby_id) { //공동육아 포기
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("id", id);
		List<FamilyInfoVO> list = dao.baby_info_co_parent(baby_id);
		if(list.size() == 1) { //공동육아하는 사람이 1명이면
			dao.delete_all(title); //아기 삭제
		} else { //공동육아하는 사람 여러명
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getId().equals(id)) {
					list.remove(i);
				}
			}
			HashMap<String, String> fam_map = new HashMap<String, String>();
			fam_map.put("title", title);
			fam_map.put("id", list.get(0).getId());
			dao.family_change(fam_map);
		}
		return gson.toJson(dao.family_exit(map));
	}
	
	@ResponseBody
	@RequestMapping(value = "deltitle.bif", produces = "application/json;charset=UTF-8")
	public void del_title(String title, String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("id", id);
		dao.family_exit(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "gettitle.bif", produces = "application/json;charset=UTF-8")
	public String get_title(String id) {
		String str = dao.get_title(id);
		System.out.println(dao.get_title(id));
		return gson.toJson(str);
	}
}