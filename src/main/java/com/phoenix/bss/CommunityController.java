package com.phoenix.bss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	
	
	//커뮤 화면 요청
	@RequestMapping("/community")
	public String join() {
		
		
		
		
		return "community/community";
	}
	
	
}