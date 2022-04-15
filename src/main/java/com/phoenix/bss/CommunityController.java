package com.phoenix.bss;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommunityController {

	//방명록 목록화면 요청
		@RequestMapping("/list.comu")
		public String list(HttpSession session, @RequestParam(defaultValue = "1") int curPage
						, Model model, String search, String keyword
						, @RequestParam(defaultValue = "10") int pageList
						, @RequestParam(defaultValue = "list") String viewType) {
			/*
			 *	session.setAttribute("category", "co");
			 * //DB에서 방명록 정보를 조회해와 목록화면에 출력 page.setCurPage(curPage); //현재 페이지를 담음
			 * page.setSearch(search); //검색 조건 page.setKeyword(keyword); //검색어
			 * page.setPageList(pageList); page.setViewType(viewType);
			 * model.addAttribute("page", service.board_list(page) );
			 */
			return "community/list";
		}
	
	
}
