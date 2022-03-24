package com.phoenix.bss;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import diary.DiaryDAO;
import diary.DiaryVO;

@Controller
public class DiaryController {
	@Autowired DiaryDAO dao;
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	//Gson gson = new Gson();
	
	@ResponseBody
	@RequestMapping(value =  "/list.di", produces="application/json;charset=UTF-8" )
	public String list(HttpServletRequest req) {
		System.out.println("list접근");
		String strDate = req.getParameter("date");
		String id = req.getParameter("id");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("date", strDate);
		map.put("id", id);
		List<DiaryVO> list = dao.diary_list(map);
		//System.out.println(list.get(0).getBaby_category());
		String data = gson.toJson(list);
		
		return data;
		 
	}
	@ResponseBody
	@RequestMapping(value =  "/insert.di", produces="application/json;charset=UTF-8" )
	public String insert(HttpServletRequest req) {
		System.out.println("insert접근");
		String strVo = req.getParameter("dto");
		DiaryVO vo = gson.fromJson(strVo, DiaryVO.class);
		System.out.println(vo.getMemo());
		//dao.diary_insert(vo);

		return gson.toJson(dao.diary_insert(vo));
		
	}
	@ResponseBody
	@RequestMapping(value =  "/detail.di", produces="application/json;charset=UTF-8" )
	public String detail(HttpServletRequest req) {
		System.out.println("detail접근");
		int no = Integer.parseInt(req.getParameter("no"));
		String data = gson.toJson(dao.diary_detail(no));
		//System.out.println(data);
		return data;
	}
	@ResponseBody
	@RequestMapping(value =  "/delete.di", produces="application/json;charset=UTF-8" )
	public String delete(HttpServletRequest req) {
		System.out.println("delete접근");
		String strVo = req.getParameter("dto");
		DiaryVO vo = gson.fromJson(strVo, DiaryVO.class);
		

		return gson.toJson(dao.diary_delete(vo));
	}
	@ResponseBody
	@RequestMapping(value =  "/update.di", produces="application/json;charset=UTF-8" )
	public String update(HttpServletRequest req) {
		System.out.println("update접근");
		String strVo = req.getParameter("dto");
		DiaryVO vo = gson.fromJson(strVo, DiaryVO.class);
		String str = gson.toJson(dao.diary_update(vo));
		System.out.println(str);
		return str;
	}
}
