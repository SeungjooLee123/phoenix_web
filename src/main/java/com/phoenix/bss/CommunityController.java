package com.phoenix.bss;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import community.CommunityPage;
import community.CommunityService;
import community.CommunityServiceImpl;


@Controller
public class CommunityController {
	
	@Autowired private CommunityServiceImpl service;
	@Autowired private CommunityPage page ;
	
	
	//커뮤 화면 요청
	@RequestMapping("/community")
	public String join(HttpSession session, @RequestParam(defaultValue = "1") int curPage
					, Model model, String search, String keyword
					, @RequestParam(defaultValue = "10") int pageList
					, @RequestParam(defaultValue = "list") String viewType) {
		session.setAttribute("category", "co");
		page.setCurPage(curPage);	//현재 페이지 담음
		page.setSearch(search);
		page.setKeyword(keyword);	//검색어
		page.setPageList(pageList);
		page.setViewType(viewType);
		model.addAttribute("page",  service.Community_list(page) );
		return "community/community";
	}
	
	
}
