package com.phoenix.bss;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import sns.SnsDAO;
import sns.SnsImgVO;
import sns.SnsVO;

@Controller
public class SnsController {
	Gson gson = new Gson();
	@Autowired SnsDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "/share.sn", produces="application/json;charset=UTF-8")
	public String sns_share(String vo) throws Exception {
		System.out.println("접근");
		SnsVO imgVO = gson.fromJson(vo, SnsVO.class);
		//imgVO.setImgList( gson.fromJson(imgvo, new TypeToken<List<String>>() {}.getType())  )  ;
	//	SnsImgVO testimg = gson.fromJson(imgvo, SnsImgVO.class);
		//System.out.println(test.getId());
		//System.out.println(testimg.getSns_img());
	//	map.put("vo", vo);
	//	map.put("imgvo", imgvo);
//		String testvo = req.getParameter("vo");

//		System.out.println(vo.getSns_content());
		//System.out.println(id);
		String imgsns = gson.toJson(dao.snsInsert(imgVO));
		return imgsns;
		
	}

}
