package com.phoenix.bss;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.CommonService;
import customer.CustomerServiceImpl;

@Controller
public class CustomerController {
	@Autowired private CustomerServiceImpl service;
	@Autowired private CommonService common;
	
	//방명록 목록화면 요청
	@RequestMapping("/list.cu")
	public String list() {
		//session.setAttribute("category", "no");

		
		//model.addAttribute("page", service.notice_list(page));
		
		return "customer/list";
	}
}
