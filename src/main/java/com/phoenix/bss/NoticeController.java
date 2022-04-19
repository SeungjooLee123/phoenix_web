package com.phoenix.bss;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.CommonService;
import notice.NoticePage;
import notice.NoticeServiceImpl;
import notice.NoticeVO;
import user.UserVO;

@Controller
public class NoticeController {
	@Autowired private NoticeServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private NoticePage page;
	
	Gson gson = new Gson(); 
	
	
	//방명록 목록화면 요청
	@RequestMapping("/list.no")
	public String list(HttpSession session, Model model, 
			           @RequestParam(defaultValue = "1") int curPage, String search, String keyword, 
			           @RequestParam(defaultValue = "10")int pageList
			           ) {
		//session.setAttribute("category", "no");

		//페이징 처리되면서 데이터 가져오기
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		
		model.addAttribute("page", service.notice_list(page));
		
		return "notice/notice";
	}
	
	//방명록 신규 글 작성화면 요청
	@RequestMapping("/new.no")
	public String board() {
		return "notice/new";
	}
	
	//신규 글 저장
	@RequestMapping("/insert.no")
	public String insert(NoticeVO vo, MultipartFile file, HttpSession session) {
		
		//첨부파일이 있다면
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload("notice", file, session));
		}
		
		//화면에서 입력한 정보를 DB에 신규 저장한 후 목록화면 연결
		vo.setUser_id(((UserVO) session.getAttribute("loginInfo")).getId());
		service.notice_insert(vo);
		
		return "redirect:list.no";
	}
	
	//방명록 첨부파일 다운로드 요청
	@RequestMapping("/download.no")   //기본정보 HttpSession, HttpServletResponse   = 이 파일의 타입을 확인하고 
	public void download(int id, HttpSession session, HttpServletResponse response) {  
		//아이디만 가져와서
		// 해당 글의 첨부파일 정보를 DB에서 조회해와 해당 파일을 서버로부터 다운로드 함(상세화면에서)
	  NoticeVO vo =	service.notice_detail(id);   //vo타입이라서 	  
	  common.fileDownload(vo.getFilename(), vo.getFilepath(), session , response);
	}
		
	
	//방명록 상세 화면 요청
	@RequestMapping("/detail.no")
	public String detail(int id, Model model) {
		//해당 글의 조회수 증가 처리
		service.notice_count(id);
		
		//해당 방명록 글을 db에서 조회해 와 상세 화면에 출력할 예정
		model.addAttribute("vo",service.notice_detail(id) );
		model.addAttribute("crlf", "\r\n"); 
		model.addAttribute("page", page);
		return "notice/detail";
	}
	
	//방명록 삭제 요청
	@RequestMapping("/delete.no")
	public String board(int id, HttpSession session, Model model) {
		
		//첨부파일이 있는 경우 디스크에서(==물리적인 위치에서) 첨부파일 삭제
		NoticeVO notice = service.notice_detail(id);
		String uuid = session.getServletContext().getRealPath("resources") + "/" + notice.getFilename();
		//filepath => 3건만 넣고 이 3건을 반복 저장했을 경우... path가 모두 똑같기 때문에 다른 하나를 지우면 사진이 다 지워진다.
		//
		//현재 uuid == 실제로 파일이 저장된 경로는 아래 => but 오류나서 띄어쓰기함
		//D:\Study_Spring\WorkSpace\.metadata\.p l u g ins \org.eclipse.wst.server.core\tmp0\w t p w e b a p p s\i o t\resources\ u p l o a d\notice\2022\02
		if(notice.getFilename() != null) {//있다면
			File file = new File(uuid);
			if(file.exists()) file.delete(); //제거
		}

		//삭제 진행 후 목록 화면으로
		service.notice_delete(id);
		return "redirect:list.no";
		
		//전달되는 값들을 숨겨서 보내기 위해
//		model.addAttribute("uri", "list.bo");	//리턴을 거쳐 도착할 페이지
//		model.addAttribute("page", page);		//여러 값을 담고 있는 page
//		return "board/redirect";
		
	}
	
	//방명록 글 수정 화면 요청
	@RequestMapping("/modify.no")
	public String modify(int id, Model model) {
		//해당 글의 정보를 db에서 조회해 와 수정 화면에 출력
		model.addAttribute("vo", service.notice_detail(id));
		return "notice/modify";
	}
	
	//방명록 글 업데이트
	@RequestMapping("/update.no")
	public String update(NoticeVO vo, MultipartFile file, HttpSession session, String attach, Model model) {
		System.out.println("controller");
		//원글에 첨부파일이 있는지 확인 + 물리적인 파일 저장 위치 찾기  => 분기를 나누기 위해
		NoticeVO notice = service.notice_detail(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") + "/" + notice.getFilepath();
		
		System.out.println(gson.toJson(vo));
		//분기 나누기		
		if(file.isEmpty()) {//파일을 첨부하지 않은 경우
			//원래부터 첨부된 파일이 없는 경우 => 처리할 거 없음
			
			//원래 첨부된 파일을 삭제했을 경우 => 물리적 영역에서 삭제해야 함
			if(attach.isEmpty()) {
				if(notice.getFilename() != null) {
					File f = new File(uuid);	//io의 filed을 import시키기
					if(f.exists()) f.delete();
				}
			
			//원래 첨부된 파일을 그대로 사용하는 경우
			}else {
				vo.setFilename(notice.getFilename());
				vo.setFilepath(notice.getFilepath());
			}
			
		}else {//파일이 있는 경우 => 새로 첨부했거나, 변경한 경우
			//파일을 새로 첨부한 경우
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload("notice", file, session));
			
			//파일을 변경한 경우
			if(notice.getFilename() != null) {//서버에 파일이 있는지 확인
				File f = new File(uuid);
				if(f.exists()) f.delete();	
			}
		}
		
		
		//화면에서 수정한 정보들을 DB에 업데이트한 후 상세화면 연결
		service.notice_update(vo);
		return "redirect:detail.no?id="+vo.getId();
		//값이 노출되지 않고 보내기 위해
//		model.addAttribute("uri", "detail.bo");
//		model.addAttribute("id", vo.getId());
//		return "board/redirect";
	}
		
}