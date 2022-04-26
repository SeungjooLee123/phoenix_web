package com.phoenix.bss;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.CommonService;
import user.UserVO;
import welfare.VideoServiceImpl;
import welfare.VideoVO;
import welfare.WelfarePage;
import welfare.WelfareServiceImpl;
import welfare.WelfareVO;

@Controller
public class WelfareController {
	@Autowired private WelfareServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private WelfarePage page;
	@Autowired private VideoServiceImpl video;
	
	//정책 화면 요청
	@RequestMapping("/list.wel")
	public String list(HttpSession session, Model model, @RequestParam(defaultValue = "1")int curPage, @RequestParam(defaultValue = "10")int pageList, String search, String keyword) {
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		
		model.addAttribute("page", service.wel_list(page));
		
		return "welfare/list";
	}
	
	//신규 입력 화면 요청
	@RequestMapping("/new.wel")
	public String wel_new(Model model) {
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
		WelfareVO before = service.wel_detail(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") + "/" + before.getFilepath();
		
		if(!file.isEmpty()) { //파일 첨부한 경우
			//첨부파일 없었는데 수정 시 첨부한 상황
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload("welfare", file, session));
			//첨부파일 있었는데 수정 시 바꿔 첨부한 상황
			if(before.getFilename() != null) {
				File f = new File(uuid);
				if(f.exists()) f.delete();
			}
		} else { //파일 첨부하지 않은 경우
			//첨부파일 없었고 수정 시 첨부하지 않은 경우
			if(attach.isEmpty()) {
				if(before.getFilename() != null) {
					File f = new File(uuid);
					if(f.exists()) f.delete();
				}
			} else {
				//원래 첨부파일 그래도 사용하는 경우
				vo.setFilename(before.getFilename());
				vo.setFilepath(before.getFilepath());
			}
		}
		
		service.wel_update(vo);
		return "redirect:list.wel";
	}
	
	//새로운 글 저장 요청
	 @RequestMapping("/insert.wel") public String wel_insert(WelfareVO vo,
	 MultipartFile file, HttpSession session) {
		 vo.setUser_id(((UserVO) session.getAttribute("loginInfo")).getId());
		 if(!file.isEmpty()) { //첨부파일이 있는 경우
			 vo.setFilename(file.getOriginalFilename());
			 vo.setFilepath(common.fileUpload("welfare", file, session));
			 }
		 service.wel_insert(vo);
		 return "redirect:list.wel";
	 }
	 
	@ResponseBody
	@RequestMapping("insert.te")
	public List<String> testtB(MultipartHttpServletRequest req , HttpSession session) {
		System.out.println();
		int fileLength =Integer.parseInt( req.getParameter("length") );
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		List<String> rtnList = new ArrayList<String>();
		for(int i = 0 ; i<fileLength ; i++) {
			rtnList.add("resources/" + common.fileUpload(  "welfare" , req.getFile("file" + i) , session ));
		}
		return rtnList ;
   }
	
	//글 삭제 요청
	@RequestMapping("/delete.wel")
	public String wel_delete(int id, HttpSession session) {
		//첨부파일 있을 경우 디스크에서 첨부파일 삭제
		WelfareVO vo = service.wel_detail(id);
		if(vo.getFilename() != null) {
			File file = new File(session.getServletContext().getRealPath("resources") + "/" + vo.getFilepath());
			if(file.exists()) file.delete();
		}
		service.wel_delete(id);
		return "redirect:list.wel";
	}
	
	//첨부파일 다운로드 요청
	@RequestMapping("/download.wel")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		WelfareVO vo = service.wel_detail(id);
		common.fileDownload(vo.getFilename(), vo.getFilepath(), session, response);
	}
	
	//동영상 화면 요청
	@RequestMapping("/video.wel")
	public String wel_video(HttpSession session, Model model, String search, String keyword) {
		page.setSearch(search);
		page.setKeyword(keyword);
		
		List<VideoVO> list = video.video_list(page);
		model.addAttribute("list", list);
		
		return "welfare/video";
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