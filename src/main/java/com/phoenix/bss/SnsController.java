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
import sns.GrowthImgVO;
import sns.GrowthVO;
import sns.SnsDAO;
import sns.SnsVO;

@Controller
public class SnsController {
	Gson gson = new Gson();
	@Autowired SnsDAO dao;
	@Autowired CommonService common;
	//final String getLocalAddr = "";
	
	
	
	@ResponseBody
	@RequestMapping(value = "/delete.sn", produces="application/json;charset=UTF-8")
	public void sns_delete(HttpServletRequest req) {
		System.out.println("delete접근");
		int no = Integer.parseInt(req.getParameter("no")+"");
		dao.snsDelete(no);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/select.sn", produces="application/json;charset=UTF-8")
	public String gro_list(HttpServletRequest req) {
		System.out.println("groList접근");
		String baby_id = req.getParameter("baby_id");
		System.out.println(baby_id);
		List<GrowthVO> list = dao.groList(baby_id);
		List<GrowthVO> imgList = new ArrayList<GrowthVO>();
		int oldGroNo = 0 ;
		if(list.size() > 0 ) {
			imgList.add(list.get(0)) ;
			oldGroNo = list.get(0).getGro_no();
		}
		for(int i = 0 ; i < list.size() ; i ++) {
			if(oldGroNo != list.get(i).getGro_no()) {		
					imgList.add(list.get(i));
					oldGroNo = list.get(i).getGro_no();
			}
		}
		int flag = 0 ;
		for(int i = 0 ; i < imgList.size(); i++) {
			for (int j = flag; j < list.size(); j++) {
				if(imgList.get(i).getGro_no() == list.get(j).getGro_no()) {
					imgList.get(i).setImgList(list.get(j).getGro_img());
					flag = j;
				}
			}
		}
		System.out.println(list.get(0).getImgList());	
		return gson.toJson(imgList);
	}
	
	@ResponseBody
	@RequestMapping(value = "/share.sn", produces="application/json;charset=UTF-8")
	public String sns_share(String vo, HttpSession session, HttpServletRequest req) throws Exception {
		System.out.println("snsShare접근");
		//SnsVO imgVO = gson.fromJson(vo, SnsVO.class);
		GrowthVO Imgvo = gson.fromJson(vo, GrowthVO.class);
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
				//imgVO.setFilename(fileList.get(i).getOriginalFilename());
			//	System.out.println(imgVO.getFilename());
			//	imgVO.setFilepath(common.fileUpload("sns",mreq.getFile("file"+i), session));
				Imgvo.setFilename(fileList.get(i).getOriginalFilename()+i);
				System.out.println(Imgvo.getFilename());
				System.out.println(Imgvo.getBaby_id());
				String server_path = "http://" + req.getLocalAddr() + ":" + req.getLocalPort() + req.getContextPath() + "/resources/";
				Imgvo.setImgList(server_path + common.fileUpload("gro", mreq.getFile("file"+i), session));
				//common.fileUpload("gro", mreq.getFile("file"+i), session);
				
			
				
			}
		}else {
			System.out.println("파일 없음");
		}
		
		String imgsns = gson.toJson(dao.snsInsert(Imgvo));
		return imgsns;
		
	}

}
