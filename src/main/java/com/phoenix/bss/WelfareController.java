package com.phoenix.bss;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.CommonService;
import welfare.WelfarePage;
import welfare.WelfareServiceImpl;
import welfare.WelfareVO;

@Controller
public class WelfareController {
	@Autowired private WelfareServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private WelfarePage page;
	
	@RequestMapping("/welfare")
	public String wel_home(HttpSession session) {
		session.setAttribute("category", "we");
		return "welfare/welfare";
	}
	
	@RequestMapping("/list.wel")
	public String list(HttpSession session, Model model, @RequestParam(defaultValue = "1") int curPage, String search, String keyword, String category) {
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		//model.addAttribute("list", service.wel_list(page));
		List<WelfareVO> list = service.wel_list(category);
		model.addAttribute("list", list);
		
		if(category.equals("출산")) return "wel/childbirth";
		return "welfare/childbirth";
	}
	
	@RequestMapping("/new.wel")
	public String wel_new() {
		return "welfare/wel_new";
	}
}