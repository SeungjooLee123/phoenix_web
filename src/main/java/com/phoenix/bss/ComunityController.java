package com.phoenix.bss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComunityController {
	//커뮤 화면 요청
	@RequestMapping("/comunity")
	public String join() {
		return "comunity/comunity";
	}
}
