package com.phoenix.bss;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;


import common.CommonService;
import sns.SnsDAO;
import sns.SnsVO;

@Controller
public class SnsController {
	Gson gson = new Gson();
	@Autowired SnsDAO dao;
	@Autowired CommonService common;
	
	
	@ResponseBody
	@RequestMapping(value = "/list.sn", produces="application/json;charset=UTF-8")
	public List<SnsVO> sns_list(String vo) {
		System.out.println("접근");
		SnsVO testVO = gson.fromJson(vo, SnsVO.class);
		System.out.println(testVO.getId());
		return dao.snsList(testVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/share.sn", produces="application/json;charset=UTF-8")
	public String sns_share(String vo, MultipartFile file, HttpSession session, HttpServletRequest req) throws Exception {
		System.out.println("접근");
		SnsVO imgVO = gson.fromJson(vo, SnsVO.class);
		if(file != null) {
			imgVO.setFilename(file.getOriginalFilename());
			System.out.println(imgVO.getFilename());
			imgVO.setFilepath(common.fileUpload("sns", file,session));
		}else {
			System.out.println("파일 없음");
		}
		
		String imgsns = gson.toJson(dao.snsInsert(imgVO));
		return imgsns;
		
	}

}
