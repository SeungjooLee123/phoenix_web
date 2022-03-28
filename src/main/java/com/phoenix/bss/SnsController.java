package com.phoenix.bss;



import java.util.ArrayList;
import java.util.Iterator;
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
	@RequestMapping(value = "/del.sn", produces="application/json;charset=UTF-8")
	public void sns_delete(HttpServletRequest req) {
		System.out.println("delete접근");
		int no = Integer.parseInt(req.getParameter("no")+"");
		dao.snsDelete(no);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/list.sn", produces="application/json;charset=UTF-8")
	public List<SnsVO> sns_list(String vo) {
		System.out.println("snsList접근");
		SnsVO testVO = gson.fromJson(vo, SnsVO.class);
		System.out.println(testVO.getId());
		return dao.snsList(testVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/share.sn", produces="application/json;charset=UTF-8")
	public String sns_share(String vo, HttpSession session, HttpServletRequest req) throws Exception {
		System.out.println("snsShare접근");
		SnsVO imgVO = gson.fromJson(vo, SnsVO.class);
		ArrayList<MultipartFile> fileList = new ArrayList<MultipartFile>();
		//for(int i=0; i<=req.get)
		//vo1~vo100 vosize = 100 ;
		int file_size = Integer.parseInt( req.getParameter("file_size")+"" ); //~1
		MultipartRequest mreq = (MultipartRequest) req;
		for (int i = 0; i < file_size; i++) {
			MultipartFile file =mreq.getFile("file"+i);
		
			//fileList.add((MultipartFile) mreq.getFiles("file"+i));
			fileList.add(file);
		}
		if(fileList.size() > 0) {
			for(int i =0; i < fileList.size(); i++) {
				imgVO.setFilename(fileList.get(i).getOriginalFilename());
				System.out.println(imgVO.getFilename());
				imgVO.setFilepath(common.fileUpload("sns",mreq.getFile("file"+i), session));
			}
		}else {
			System.out.println("파일 없음");
		}
		
		String imgsns = gson.toJson(dao.snsInsert(imgVO));
		return imgsns;
		
	}

}
