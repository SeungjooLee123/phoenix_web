package com.phoenix.bss;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import babyinfo.BabyInfoDAO;
import babyinfo.BabyInfoVO;
import babyinfo.FamilyInfoVO;

@Controller
public class BabyInfoController {
	@Autowired BabyInfoDAO dao;
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
	
	@ResponseBody
	@RequestMapping(value = "/list.bif", produces="application/json;charset=UTF-8")
	public String babyinfo_list(HttpServletRequest req, HttpServletResponse res) throws IOException {
		List<BabyInfoVO> list = dao.baby_info_list();
		String data = gson.toJson(list);
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/rels.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_rels(HttpServletRequest req, HttpServletResponse res) throws IOException{
		String baby_id = req.getParameter("baby");
		String rels = gson.toJson(dao.baby_info_rels(baby_id));
		return rels;
	}
	
	@ResponseBody
	@RequestMapping(value = "/chTitle.bif", produces = "application/json;charset=UTF-8")
	public void babyinfo_title_change(HttpServletRequest req, HttpServletResponse res) throws IOException{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", req.getParameter("title"));
		map.put("baby_id", req.getParameter("baby_id"));
		dao.baby_info_title_change(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/coparent.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_coparent(HttpServletRequest req, HttpServletResponse res) throws IOException{
		String baby_id = req.getParameter("baby_id");
		List<FamilyInfoVO> coparent = dao.baby_info_co_parent(baby_id);
		return gson.toJson(coparent);
	}
	
	@ResponseBody
	@RequestMapping(value = "/titlelist.bif", produces = "application/json;charset=UTF-8")
	public String babyinfo_title_list(HttpServletRequest req, HttpServletResponse res) throws IOException{
		return gson.toJson(dao.baby_info_title_list());
	}
}