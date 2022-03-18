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

import babyinfo.BabyInfoDAO;
import babyinfo.BabyInfoVO;

@Controller
public class BabyInfoController {
	@Autowired BabyInfoDAO dao;
	Gson gson = new Gson();
	
	@ResponseBody
	@RequestMapping("/list.bif")
	public void babyinfo_list(HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println("접근");
		List<BabyInfoVO> list = dao.baby_info_list();
		PrintWriter writer = res.getWriter();
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		String data = gson.toJson(list);
		writer.print(data);
	}
}