package com.phoenix.bss;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	@RequestMapping("/calendar")
	public String calendar(HttpSession session ) {
		session.setAttribute("category", "ca");
		return "calendar/calendar";
	}

}
