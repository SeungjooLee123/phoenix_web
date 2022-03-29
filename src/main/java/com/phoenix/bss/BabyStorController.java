package com.phoenix.bss;

import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import storage.BabyStorDAO;
import storage.BabyStorVO;

@Controller
public class BabyStorController {
	@Autowired BabyStorDAO dao;
	
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	
	@ResponseBody
	@RequestMapping(value = "/cntbody.stor", produces = "application/json;charset=UTF-8")
	public String cnt_baby(String baby_id) {
		BabyStorVO vo = dao.cntBody(baby_id);
		if(vo == null) {
			return gson.toJson("키, 몸무게 기록이 없습니다.");
		}
		return gson.toJson(vo.getStor_cm() + "cm, " + vo.getStor_kg() + "kg");
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert.stor", produces = "application/json;charset=UTF-8")
	public boolean insert(HttpServletRequest req) {
		BabyStorVO vo = gson.fromJson(req.getParameter("vo"), BabyStorVO.class) ;
		
		return dao.insert(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/select.stor", produces = "application/json;charset=UTF-8")
	public String select(String date, String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("date", date);
		map.put("id", id);
		
		BabyStorVO vo = dao.select(map);
		if(vo == null) {
			return null;
		}
		
		return gson.toJson(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/update.stor", produces = "application/json;charset=UTF-8")
	public String update(HttpServletRequest req) {
		BabyStorVO vo = gson.fromJson(req.getParameter("vo"), BabyStorVO.class) ;
		
		return gson.toJson(dao.update(vo));
	}
	
	@ResponseBody
	@RequestMapping(value = "/select.stor", produces = "application/json;charset=UTF-8")
	public String select_graph(String category, String baby_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("baby_id", baby_id);
		
		if(category.equals("heat")) {
			
		} else if(category.equals("height")) {
			
		} else if(category.equals("weight")) {
			
		}
		return "";
	}
}