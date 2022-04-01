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
	
	@ResponseBody
	@RequestMapping(value = "/list.bif", produces="application/json;charset=UTF-8")
	public String babyinfo_list(String id) throws IOException {
		List<BabyInfoVO> list = dao.baby_info_list(id);
		String data = gson.toJson(list);
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/rels.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_rels(String id, String baby_id) throws IOException{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("baby_id", baby_id);
		String rels = gson.toJson(dao.baby_info_rels(map));
		return rels;
	}
	
	@ResponseBody
	@RequestMapping(value = "/chTitle.bif", produces = "application/json;charset=UTF-8")
	public void babyinfo_title_change(String title, String baby_id) throws IOException{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("baby_id", baby_id);
		dao.baby_info_title_change(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/coparent.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_coparent(String baby_id) throws IOException{
		List<FamilyInfoVO> coparent = dao.baby_info_co_parent(baby_id);
		return gson.toJson(coparent);
	}
	
	@ResponseBody
	@RequestMapping(value = "/titlelist.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_title_list() throws IOException{
		return gson.toJson(dao.baby_info_title_list());
	}
	
	@ResponseBody
	@RequestMapping(value = "/updatebaby.bif", produces = "application/json;charset=UTF-8")
	public boolean babyinfo_update(String vo, String family, HttpServletRequest req, HttpSession session) throws IOException {
		BabyInfoVO baby = gson.fromJson(vo, BabyInfoVO.class);
		MultipartRequest mulReq = (MultipartRequest) req;
		MultipartFile file = mulReq.getFile("file");
		if(file != null) {
			System.out.println(file.getOriginalFilename());
			String path = common.fileUpload("profile", file, session);
			String server_path = "http://" + req.getLocalAddr() + ":" + req.getLocalPort() + req.getContextPath() + "/resources/";
			baby.setBaby_photo(server_path + path);
		}
		return dao.baby_info_update(baby) || dao.baby_info_rels_update(gson.fromJson(family, FamilyInfoVO.class));
	}
	

	@ResponseBody
	@RequestMapping(value = "/babydel.bif", produces = "application/json;charset=UTF-8")
	public boolean babyinfo_delete(String baby_id) {
		return dao.baby_info_delete(baby_id);
	}
}