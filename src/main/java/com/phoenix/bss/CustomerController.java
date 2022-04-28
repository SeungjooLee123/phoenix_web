package com.phoenix.bss;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.CommonService;
import customer.CustomerServiceImpl;
import customer.CustomerVO;
import user.UserVO;

@Controller
public class CustomerController {
	@Autowired private CustomerServiceImpl service;
	@Autowired private CommonService common;
	
	@RequestMapping("/list.cu")
	public String list(HttpSession session, Model model, String category) {
		//cs -> 마음에 안 들면 변경
		session.setAttribute("category", "cs");
		category = category == null ? "nomal" : category;
		List<CustomerVO> list = service.customer_list(category);
		model.addAttribute("list", list);
		model.addAttribute("crlf","\r\n");
		model.addAttribute("cu_category", category);
		return "customer/list";
	}
	
//	@RequestMapping("/detail.cu")
//	public String detail(int id, Model model) {
//		//선택한 고객 정보를 db에서 조회하고 보냄
//		model.addAttribute("vo", service.customer_detail(id));
//		model.addAttribute("crlf", "\r\n"); 
//		return "customer/detail";
//	}
	
	@RequestMapping("/modify.cu")
	public String update(int id, Model model) {
		//수정 전 기존의 정보를 가져와 화면에 보여줘야함
		model.addAttribute("vo", service.customer_detail(id));
		model.addAttribute("crlf","\r\n");
		return "customer/modify";
	}
	
	//업데이트
	@RequestMapping("/update.cu")
	public String update(CustomerVO vo) {
		System.out.println("update");
		//CustomerVO cus = service.customer_detail(vo.getId());
		Gson gson = new Gson();
		System.out.println(gson.toJson(vo));
		//수정된 정보를 db에 업데이트 한 후 상세 화면으로 연결
		service.customer_update(vo);
		return "redirect:list.cu";
	}
	
	//저장
	@RequestMapping("/insert.cu")
	public String insert(CustomerVO vo, HttpSession session, MultipartFile file) {
		//첨부파일이 있다면
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload("customer", file, session));
		}
		//입력한 정보를 db에 저장 후 목록 화면으로 연결
		vo.setUser_id(((UserVO) session.getAttribute("loginInfo")).getId());
		service.customer_insert(vo);
		return "redirect:list.cu";//새로운 데이터 목록을 다시 조회해서 가야하므로
	}
	
	//방명록 첨부파일 다운로드 요청
	@RequestMapping("/download.cu")   //기본정보 HttpSession, HttpServletResponse   = 이 파일의 타입을 확인하고 
	public void download(int id, HttpSession session, HttpServletResponse response) {  
		//아이디만 가져와서
		// 해당 글의 첨부파일 정보를 DB에서 조회해와 해당 파일을 서버로부터 다운로드 함(상세화면에서)
	  CustomerVO vo =	service.customer_detail(id);   //vo타입이라서 	  
	  common.fileDownload(vo.getFilename(), vo.getFilepath(), session , response);
	}
		
	//신규 고객 등록 화면 요청
	@RequestMapping("/new.cu")
	public String new_customer() {
		return "customer/new";
	}
	
	//삭제
	@RequestMapping("/delete.cu")
	public String delete(int id, HttpSession session) {
		
		CustomerVO cus = service.customer_detail(id);
		String uuid = session.getServletContext().getRealPath("resources") + "/" + cus.getFilename();
		if(cus.getFilename() != null) {//있다면
			File file = new File(uuid);
			if(file.exists()) file.delete(); //제거
		}
		
		service.customer_delete(id);
		return "redirect:list.cu";
	}
}
