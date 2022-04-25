package com.phoenix.bss;

import java.io.File;

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
import community.CommunityPage;
import community.CommunityService;
import community.CommunityServiceImpl;
import community.CommunityVO;
import notice.NoticeVO;
import user.UserVO;


@Controller
public class CommunityController {
	
	@Autowired private CommunityServiceImpl service;
	@Autowired private CommunityPage page ;
	@Autowired private CommonService common;
	
	Gson gson = new Gson(); 
	
	
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
	
	
	//커뮤 글 수정 화면 요청
		@RequestMapping("/modify.co")
		public String modify(int id, Model model) {
			//해당 글의 정보를 db에서 조회해 와 수정 화면에 출력
			model.addAttribute("vo", service.Community_detail(id));
			return "community/modify";
		}
	
	
		//게시글 업데이트
		@RequestMapping("/update.co")
		public String update(CommunityVO vo, MultipartFile file, HttpSession session, String attach, Model model) {
			System.out.println("controller");
			//원글에 첨부파일이 있는지 확인 + 물리적인 파일 저장 위치 찾기  => 분기를 나누기 위해
			CommunityVO community = service.Community_detail(vo.getId());
			String uuid = session.getServletContext().getRealPath("resources") + "/" + community.getWeb_path();
			
			System.out.println(gson.toJson(vo));
			//분기 나누기		
			if(file.isEmpty()) {//파일을 첨부하지 않은 경우
				//원래부터 첨부된 파일이 없는 경우 => 처리할 거 없음
				
				//원래 첨부된 파일을 삭제했을 경우 => 물리적 영역에서 삭제해야 함
				if(attach.isEmpty()) {
					if(community.getWeb_file() != null) {
						File f = new File(uuid);	//io의 filed을 import시키기
						if(f.exists()) f.delete();
					}
				
				//원래 첨부된 파일을 그대로 사용하는 경우
				}else {
					vo.setWeb_file( community.getWeb_file() );
					vo.setWeb_path( community.getWeb_path() );
				}
				
			}else {//파일이 있는 경우 => 새로 첨부했거나, 변경한 경우
				//파일을 새로 첨부한 경우
				vo.setWeb_file(file.getOriginalFilename());
				vo.setWeb_path(common.fileUpload("notice", file, session));
				
				//파일을 변경한 경우
				if(community.getWeb_file() != null) {//서버에 파일이 있는지 확인
					File f = new File(uuid);
					if(f.exists()) f.delete();	
				}
			}
			
			
			//화면에서 수정한 정보들을 DB에 업데이트한 후 상세화면 연결
			service.Community_update(vo);
			return "redirect:detail.co?id="+vo.getId();
			//값이 노출되지 않고 보내기 위해
//			model.addAttribute("uri", "detail.bo");
//			model.addAttribute("id", vo.getId());
//			return "board/redirect";
		}
		
		
		//방명록 삭제 요청
		@RequestMapping("/delete.co")
		public String board(int id, HttpSession session, Model model) {
			
			//첨부파일이 있는 경우 디스크에서(==물리적인 위치에서) 첨부파일 삭제
			CommunityVO Community = service.Community_detail(id);
			String uuid = session.getServletContext().getRealPath("resources") + "/" + Community.getWeb_file();
			//filepath => 3건만 넣고 이 3건을 반복 저장했을 경우... path가 모두 똑같기 때문에 다른 하나를 지우면 사진이 다 지워진다.
			//
			//현재 uuid == 실제로 파일이 저장된 경로는 아래 => but 오류나서 띄어쓰기함
			//D:\Study_Spring\WorkSpace\.metadata\.p l u g ins \org.eclipse.wst.server.core\tmp0\w t p w e b a p p s\i o t\resources\ u p l o a d\notice\2022\02
			if(Community.getWeb_file() != null) {//있다면
				File file = new File(uuid);
				if(file.exists()) file.delete(); //제거
			}

			//삭제 진행 후 목록 화면으로
			service.Community_delete(id);
			return "redirect:community";
			
			//전달되는 값들을 숨겨서 보내기 위해
//			model.addAttribute("uri", "list.bo");	//리턴을 거쳐 도착할 페이지
//			model.addAttribute("page", page);		//여러 값을 담고 있는 page
//			return "board/redirect";
			
		}
		
		
		//게시글 첨부파일 다운로드 요청
		@RequestMapping("/download.co")   //기본정보 HttpSession, HttpServletResponse   = 이 파일의 타입을 확인하고 
		public void download(int id, HttpSession session, HttpServletResponse response) {  
			//아이디만 가져와서
			// 해당 글의 첨부파일 정보를 DB에서 조회해와 해당 파일을 서버로부터 다운로드 함(상세화면에서)
		  CommunityVO Community =	service.Community_detail(id);   //vo타입이라서 	  
		  common.fileDownload(Community.getWeb_file(), Community.getWeb_path(), session , response);
		}
		
}
