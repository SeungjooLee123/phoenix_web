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

import common.CommonService;
import customer.CustomerServiceImpl;
import customer.CustomerVO;
import user.UserVO;

@Controller
public class CustomerController {
	@Autowired private CustomerServiceImpl service;
	@Autowired private CommonService common;
	
	//방명록 목록화면 요청
	@RequestMapping("/list.cu")
	public String list(HttpSession session, Model model) {
		//cs -> 마음에 안 들면 변경
		session.setAttribute("category", "cs");
		List<CustomerVO> list = service.customer_list();
		model.addAttribute("list", list);
		return "customer/list";
	}
	
	//고객 개인정보 상세 화면 요청
	@RequestMapping("/detail.cu")
	public String detail(int id, Model model) {
		//선택한 고객 정보를 db에서 조회하고 보냄
		model.addAttribute("vo", service.customer_detail(id));
		model.addAttribute("crlf", "\r\n"); 
		return "customer/detail";
	}
	
	@RequestMapping("/modify.cu")
	public String update(int id, Model model) {
		//수정 전 기존의 정보를 가져와 화면에 보여줘야함
		model.addAttribute("vo", service.customer_detail(id));
		return "customer/modify";
	}
	
	//업데이트
	@RequestMapping("/update.cu")
	public String update(CustomerVO vo, MultipartFile file, HttpSession session, String attach) {
		CustomerVO cus = service.customer_detail(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") + "/" + cus.getFilepath();
		
		if(file.isEmpty()) {//파일을 첨부하지 않은 경우
			//원래부터 첨부된 파일이 없는 경우 => 처리할 거 없음
			
			//원래 첨부된 파일을 삭제했을 경우 => 물리적 영역에서 삭제해야 함
			if(attach.isEmpty()) {
				if(cus.getFilename() != null) {
					File f = new File(uuid);	//io의 filed을 import시키기
					if(f.exists()) f.delete();
				}
			
			//원래 첨부된 파일을 그대로 사용하는 경우
			}else {
				vo.setFilename(cus.getFilename());
				vo.setFilepath(cus.getFilepath());
			}
			
		}else {//파일이 있는 경우 => 새로 첨부했거나, 변경한 경우
			//파일을 새로 첨부한 경우
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload("customer", file, session));
			
			//파일을 변경한 경우
			if(cus.getFilename() != null) {//서버에 파일이 있는지 확인
				File f = new File(uuid);
				if(f.exists()) f.delete();	
			}
		}
		
		//수정된 정보를 db에 업데이트 한 후 상세 화면으로 연결
		service.customer_update(vo);
		return "redirect:detail.cu?id="+vo.getId();
	}
	
	//신규 고객 정보 저장
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
