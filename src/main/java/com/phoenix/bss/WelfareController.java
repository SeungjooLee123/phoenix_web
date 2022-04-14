package com.phoenix.bss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelfareController {
	@RequestMapping("/welfare")
	public String wel_home() {
		return "welfare/welfare";
	}
}