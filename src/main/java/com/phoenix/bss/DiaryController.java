package com.phoenix.bss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DiaryController {
	@ResponseBody
	@RequestMapping(value =  "/insert.di", produces="application/json;charset=UTF-8" )
	public void home() {
		System.out.println("접근");
		//왜 안돼 유ㅐ
	}
}
