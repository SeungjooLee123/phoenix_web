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
import com.google.gson.GsonBuilder;

import common.CommonService;
import sns.GrowthImgVO;
import sns.GrowthVO;
import sns.SnsDAO;
import sns.SnsVO;

@Controller
public class SnsController {
	Gson gson = new GsonBuilder().setDateFormat("MM-dd").create();
	@Autowired SnsDAO dao;
	@Autowired CommonService common;
	private final String getLocalAddr = "121.148.239.238:5524";
	
	
	
	@ResponseBody
	@RequestMapping(value = "/delete.sn", produces="application/json;charset=UTF-8")
	public String sns_delete(HttpServletRequest req) {
		System.out.println("delete접근");
		int no = Integer.parseInt(req.getParameter("no")+"");
		return gson.toJson(dao.groDelete(no));
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/update.sn", produces="application/json;charset=UTF-8")
	public String gro_update(HttpServletRequest req) {
		System.out.println("groUpdate접근");
		String testvo =  req.getParameter("vo");
		GrowthVO vo = gson.fromJson(testvo, GrowthVO.class);
		dao.groupdate(vo);
	
		return "";
	}
	

	
	
	
	@ResponseBody
	@RequestMapping(value = "/select.sn", produces="application/json;charset=UTF-8")
	public String gro_list(HttpServletRequest req) {
		System.out.println("groList접근");
		
		// baby id 가져옴
		String baby_id = req.getParameter("baby_id");
		System.out.println(baby_id);
		
		// 게시물 리스트. 
		List<GrowthVO> list = dao.groList(baby_id);
		
		// 이미지게시물 ( 임시 ) 선언
		List<GrowthVO> imgList = new ArrayList<GrowthVO>();
		
		// 게시물이 없을 때 날리기
		if(list.size() < 1) return gson.toJson(null);
		
		// 이미지 리스트의 인덱스
		int idx_imgList = 0;
		for(int i = 0; i < list.size(); i++) {
			// 처음엔 무조건 들어가게.
			if(i == 0) imgList.add(list.get(i));
			
			
			if(imgList.get(idx_imgList).getGro_no() == list.get(i).getGro_no()) {
				imgList.get(idx_imgList).setImgList(list.get(i).getGro_img());
			} else {
				imgList.add(list.get(i));
				imgList.get(++idx_imgList).setImgList(list.get(i).getGro_img());
			}
		}
		
		return gson.toJson(imgList);
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/text.sn", produces="application/json;charset=UTF-8")
//	public String text_share(HttpServletRequest req) {
//		System.out.println("textShare접근");
//		return "";
//	}
//	
	
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
			
				System.out.println(Imgvo.getBaby_id());
				String server_path = "http://" + getLocalAddr + req.getContextPath() + "/resources/";
				Imgvo.setImgList(server_path + common.fileUpload("gro", mreq.getFile("file"+i), session));
				Imgvo.setFilename(fileList.get(i).getOriginalFilename());
				Imgvo.setB_id(Imgvo.getBaby_id());
			
				//common.fileUpload("gro", mreq.getFile("file"+i), session);	
			}
		}else {
			System.out.println("파일 없음");
		}
		
		String imgsns = gson.toJson(dao.snsInsert(Imgvo));
		System.out.println(imgsns);
		return imgsns;
		
	}

}
