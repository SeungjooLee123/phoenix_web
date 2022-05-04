package com.phoenix.bss;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		//주석달았다.
		
		session.removeAttribute("category");
		session.setAttribute("category", "");
		
		return "main";
	}
	
	//error처리 페이지 요청
		@RequestMapping("/error")
		public String error (HttpSession session, HttpServletRequest req, Model model) {
			session.setAttribute("category", "error");
			Throwable error = (Throwable) req.getAttribute("javax.servlet.error.exception"); //던진다는 의미의 클래스 -> 캐스팅해줘야함
			//에러 내용 -> 긴문자를 가져와야함 버퍼사용 -> 몇 개일지 모르고 계속 받아와야함 (반복)
			StringBuffer msg = new StringBuffer();
			while(error != null) {
				msg.append("<p>").append(error.getMessage()).append("</p>");
				error = error.getCause();
			}//에러 내용을 화면에 뿌릴것 -> model
			model.addAttribute("msg", msg.toString());
			
			int code = (int) req.getAttribute("javax.servlet.error.status_code");
			return "error/" + (code == 404? 404 : "common");
			//error 코드가 404 이면 404.jsp를 아니면 common.jsp 페이지로 리턴
		
		}
	
	
	
}
