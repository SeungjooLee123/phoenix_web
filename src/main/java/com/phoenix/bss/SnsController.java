package com.phoenix.bss;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import sns.SnsDAO;
import sns.SnsImgVO;
import sns.SnsVO;

@Controller
public class SnsController {
	Gson gson = new Gson();
	@Autowired SnsDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "/share.sn", produces="application/json;charset=UTF-8")
	public String sns_share(String vo, String imgvo) throws Exception {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		System.out.println("접근");
		SnsVO test = gson.fromJson(vo, SnsVO.class);
		SnsImgVO testimg = gson.fromJson(imgvo, SnsImgVO.class);
		System.out.println(test.getId());
		System.out.println(testimg.getSns_img());
		map.put("vo", vo);
		map.put("imgvo", imgvo);
//		String testvo = req.getParameter("vo");

//		System.out.println(vo.getSns_content());
		//System.out.println(id);
		String imgsns = gson.toJson(dao.snsInsert(map));
		return imgsns;
		
	}

}
