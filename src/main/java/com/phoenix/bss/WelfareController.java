package com.phoenix.bss;


import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.CommonService;
import user.UserVO;
import welfare.WelfarePage;
import welfare.WelfareServiceImpl;
import welfare.WelfareVO;

@Controller
public class WelfareController {
	@Autowired private WelfareServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private WelfarePage page;
	Gson gson = new Gson();
	
	//정책 화면 요청
	@RequestMapping("/list.wel")
	public String list(HttpSession session, Model model, @RequestParam(defaultValue = "1")int curPage, @RequestParam(defaultValue = "10")int pageList, String search, String keyword, String category) {
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		
		System.out.println(category);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("page", gson.toJson(page));
		
		model.addAttribute("page", service.wel_list(map));
		model.addAttribute("category", category);
		
		return "welfare/list";
	}
	
	//신규 입력 화면 요청
	@RequestMapping("/new.wel")
	public String wel_new(String category, Model model) {
		model.addAttribute("category", category);
		return "welfare/new";
	}
	
	//글 상세화면 요청
	@RequestMapping("/detail.wel")
	public String wel_detail(int id, Model model) {
		model.addAttribute("vo", service.wel_detail(id));
		model.addAttribute("crlf", "\r\n");
		
		model.addAttribute("page", page);
		return "welfare/detail";
	}
	
	//수정 화면 요청
	@RequestMapping("/modify.wel")
	public String wel_modify(int id, Model model) {
		model.addAttribute("vo", service.wel_detail(id));
		return "welfare/modify";
	}
	
	//수정한 내용 저장 요청
	@RequestMapping("/update.wel")
	public String wel_update(WelfareVO vo, String attach, MultipartFile file, HttpSession session) {
		return "redirect:detail.wel?id=" + vo.getId();
	}
	
	//새로운 글 저장 요청
	@RequestMapping("/insert.wel")
	public String wel_insert(WelfareVO vo, MultipartFile file, HttpSession session) {
		vo.setUser_id(((UserVO) session.getAttribute("loginInfo")).getId());
		if(!file.isEmpty()) { //첨부파일이 있는 경우
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload("welfare", file, session));
		}
		service.wel_insert(vo);
		
		return "redirect:list.wel?category=" + vo.getCategory();
	}
	
	//글 삭제 요청
	@RequestMapping("/delete.wel")
	public String wel_delete(int id, HttpSession session) {
		//첨부파일 있을 경우 디스크에서 첨부파일 삭제
		WelfareVO vo = service.wel_detail(id);
		String uuid = session.getServletContext().getRealPath("resource") + "/" + vo.getFilepath();
		if(vo.getFilename() != null) {
			File file = new File(uuid);
			if(file.exists()) file.delete();
		}
		service.wel_delete(id);
		return "redirect:list.wel?category=" + vo.getCategory();
	}
	
	//첨부파일 다운로드 요청
	@RequestMapping("/download.wel")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		WelfareVO vo = service.wel_detail(id);
		common.fileDownload(vo.getFilename(), vo.getFilepath(), session, response);
	}
	
	//통계자료 화면 요청
	@RequestMapping("/graph.wel")
	public String wel_graph() {
		return "welfare/graph";
	}
	
	//주변장소검색 화면 요청
	@RequestMapping("/map.wel")
	public String wel_map() {
		return "welfare/map";
	}
}