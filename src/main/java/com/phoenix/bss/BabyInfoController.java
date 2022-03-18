package com.phoenix.bss;

import java.io.IOException;
import java.io.PrintWriter;
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

@Controller
public class BabyInfoController {
	@Autowired BabyInfoDAO dao;
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	
	@ResponseBody
	@RequestMapping(value = "/list.bif", produces="application/json;charset=UTF-8")
	public String babyinfo_list(HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println("접근");
		List<BabyInfoVO> list = dao.baby_info_list();
		System.out.println(list.get(0).getBaby_birth());
		String data = gson.toJson(list);
		return data;
	}
}