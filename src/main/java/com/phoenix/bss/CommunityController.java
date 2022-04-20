package com.phoenix.bss;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import community.CommunityPage;
import community.CommunityService;
import community.CommunityServiceImpl;
import community.CommunityVO;
import user.UserVO;


@Controller
public class CommunityController {
	
	@Autowired private CommunityServiceImpl service;
	@Autowired private CommunityPage page ;
	@Autowired private CommonService common;
	
	//커뮤 목록 화면 요청
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
//		page.setViewType(viewType);
		model.addAttribute("page",  service.Community_list(page) );
		return "community/community";
	}
	
	//커뮤 신규 글 작성 화면 요청
	@RequestMapping("/new.co")
	public String board() {
		return "community/new";
	}
	
	//커뮤 신규 글 저장 처리 요청
	@RequestMapping("/insert.co")
	public String insert(CommunityVO vo, MultipartFile file, HttpSession session	) {
		//파일 정보가 있다면 -첨부파일 처리부
		System.out.println(vo.getId());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		System.out.println(vo.getCnt());
		System.out.println(vo.getWeb_file());
		System.out.println(vo.getWeb_path());
		System.out.println(vo.getWeb_date());
		System.out.println(vo.getUser_id());
		System.out.println(vo.getNext_title());
		System.out.println(vo.getPrev_title());
		if(! file.isEmpty() ) {
			vo.setWeb_file( file.getOriginalFilename() );
			vo.setWeb_path( common.fileUpload("community", file, session) );
		}
		// 로그인 된 사용자의 id를 가져와 글쓴이(writer)에 담기 위한 처리
		vo.setUser_id( ((UserVO) session.getAttribute("loginInfo")).getId() );
		
		service.Community_insert(vo);
		return "redirect:community";
	}
	
	
	//커뮤 게시글 상세 화면 요청
	@RequestMapping("/detail.co")
	public String detail(int id, Model model) {
		//해당 글의 조회수 증가 처리
		service.Community_read(id);
		
		//해당 게시글을 DB에서 조회 후 상세화면에 출력
		model.addAttribute("vo",service.Community_detail(id) );
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("page", page);
		return "community/detail";
	}
	
	
	
	
}
