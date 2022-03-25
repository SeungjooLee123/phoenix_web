package com.phoenix.bss;

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
	@RequestMapping(value = "/cntbody.stor", produces = "application/json;charset=UTF-8")
	public String cnt_baby(String baby_id) {
		BabyStorVO vo = dao.cntBody(baby_id);
		if(vo == null) {
			return gson.toJson("키, 몸무게 기록이 없습니다.");
		}
		return gson.toJson(vo.getStor_cm() + "cm, " + vo.getStor_kg() + "kg");
	}
}