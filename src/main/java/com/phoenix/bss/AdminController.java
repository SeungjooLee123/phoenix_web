package com.phoenix.bss;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.AdminPage;
import admin.AdminServiceImpl;
import admin.Admin_UserVO;
import common.CommonService;
import customer.CustomerVO;

@Controller
public class AdminController {
	
	@Autowired private AdminServiceImpl service;
	@Autowired private AdminPage page;
	@Autowired private CommonService common;
	
	//admin
//	@RequestMapping("/admin")
//	public String userList(Model model, HttpSession session, @RequestParam(defaultValue = "1")int curPage, @RequestParam(defaultValue = "20")int pageList, 
//			@RequestParam(defaultValue = "id") String search,
//			@RequestParam(defaultValue = "all") String keyword) {
//	session.setAttribute("category", "ad");
//	page.setCurPage(curPage);
//	page.setSearch(search);
//	page.setKeyword(keyword);
//	page.setPageList(pageList);
//	model.addAttribute("page", service.admin_user_list(page));
//	
////	List<Admin_UserVO> list = service.admin_user_list();
////	model.addAttribute("list", list);
//	//전체 회원 조회
//		return "mypage/admin-list";
//	}
	
	
	
	
//	@RequestMapping("/admin")
//	public String userList(Model model, HttpSession session) {
//		session.setAttribute("category", "ad");
//		List<Admin_UserVO> list =  service.admin_user_list();
//		model.addAttribute("list", list);
//		return "mypage/admin-list";
//	}
	
//	@RequestMapping("search.ad")
//	public String userSearch(String search, String keyword, Model model) {
//		page.setKeyword(keyword);
//		page.setSearch(search);
//		return "";
//	}
	


	//(카테고리별) 문의사항 화면 요청
	@RequestMapping("/admin")
	public String questionList(Model model, HttpSession session, String category) {
		session.setAttribute("category", "ad");
		category = category == null ? "nomal" : category;
		List<CustomerVO> list = service.customer_list(category);
		model.addAttribute("list", list);
		return "mypage/question-list";
	}
	
	//문의 사항 디테일 요청
	@RequestMapping("/detail.ad")
	public String datailuser(Model model, String title) {
		CustomerVO vo = service.admin_qanda_detail(title);
		model.addAttribute("vo", vo);
		return "mypage/detail_qanda";
	}
	
	//방명록 첨부파일 다운로드 요청
	@RequestMapping("/download.bo")
	public void download(int id, HttpSession session, HttpServletResponse req) {
		//	해당 글의 첨부파일 정보를 DB에서 조회해와 해당 파일을 서버로부터 다운로드함.
		CustomerVO vo = service.admin_file(id);
		common.fileDownload(vo.getFilename(), vo.getFilepath(), session, req); //현제 프로젝트가 돌아가는 서버 추출 - 세션
		//첨부파일의 타입을 지정 - 헤더
		
	}
	
	
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
}
