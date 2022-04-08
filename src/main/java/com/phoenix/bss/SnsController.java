package com.phoenix.bss;



import java.io.File;
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
import com.google.gson.reflect.TypeToken;

import common.CommonService;
import sns.GrowthImgVO;
import sns.GrowthVO;
import sns.SnsDAO;

@Controller
public class SnsController {
	Gson gson = new GsonBuilder().setDateFormat("MM-dd").create();
	@Autowired SnsDAO dao;
	@Autowired CommonService common;
	private final String getLocalAddr = "121.148.239.238:5524";
	
	
	//성장일기 게시물 삭제 -> 해당 폴더에서 사진 파일 삭제
	@ResponseBody
	@RequestMapping(value = "/delete.sn", produces="application/json;charset=UTF-8")
	public String sns_delete(HttpServletRequest req, HttpSession session) {
		System.out.println("delete접근");
		
		int no = Integer.parseInt(req.getParameter("no")+"");
		System.out.println(no);
		List<GrowthVO> list = dao.gro_img(no);
		
		System.out.println(list.get(0).getGro_img());
		if(list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				String test = list.get(i).getGro_img();
				System.out.println(test);
				common.fileDelete(test, session);
			}
		}
		String result = gson.toJson(dao.groDelete(no));
		System.out.println(result);
		return result;
	}
	
	//성장일기 게시물 수정
	@ResponseBody
	@RequestMapping(value = "/update.sn", produces="application/json;charset=UTF-8")
	public String gro_update(HttpServletRequest req, HttpSession session) {
		System.out.println("groUpdate접근");
		int no = Integer.parseInt(req.getParameter("no")+"");
		System.out.println(no);
		List<GrowthVO> testlist = dao.select_imgs(no);

		List<GrowthVO> imgList = new ArrayList<GrowthVO>();
		
		
		
		
		int idx_imgList = 0;
		
		for(int i = 0; i < testlist.size(); i++) {
		
			if(i == 0) imgList.add(testlist.get(i));
		
			if(imgList.get(idx_imgList).getGro_no() == testlist.get(i).getGro_no()) {
				imgList.get(idx_imgList).setImgList(testlist.get(i).getGro_img());
			} else {
				imgList.add(testlist.get(i));
				imgList.get(++idx_imgList).setImgList(testlist.get(i).getGro_img());
			}
		}
		return gson.toJson(imgList);
		
		
		
//		List<GrowthVO> list = null;
//		for(int i =0; i<testlist.size(); i++) {
//			String test = gson.toJson(testlist.get(i), GrowthVO.class);
//			System.out.println(test);
//			 List<GrowthVO> imglist = gson.fromJson(test, new TypeToken<List<GrowthVO>>() {}.getType());
//			list = imglist;
//		}
		//return gson.toJson(list);
		
		
		
		//이미지 지움
		//dao.del_img(no); 됨
		//해당글 이미지 목록 가져와서 파일지우기
//		List<GrowthVO> img_list =  dao.select_imgs(no);
//		
//		for(int i=0; i < img_list.size(); i++) {
//			System.out.println(img_list.get(i).getGro_img());
//			String test = img_list.get(i).getGro_img();
//			common.fileDelete(test, session);
//		}
		
//		//해당 게시글 조회
//		GrowthVO vo = dao.select_text(no);
//		System.out.println(vo.getGro_no());
//		System.out.println(vo.getGro_content());
//		//게시글 업데이트 
//		GrowthVO testvo = dao.text_update(vo);
//		System.out.println(testvo.getGro_no());
//		String test = "";
//		
//		//수정사항 넣어줌
//		List<GrowthVO> list =  dao.insertall(testvo);
//		System.out.println(list.get(no).getGro_content());
//		

		
	}
	

	
	
	//성장일기 조회
	@ResponseBody
	@RequestMapping(value = "/select.sn", produces="application/json;charset=UTF-8")
	public String gro_list(HttpServletRequest req) {
		System.out.println("groList접근");
		
	
		String baby_id = req.getParameter("baby_id");
		System.out.println(baby_id);
		
		// 성장일기 리스트 
		List<GrowthVO> list = dao.groList(baby_id);
		
		// 이미지게시물 따로 
		List<GrowthVO> imgList = new ArrayList<GrowthVO>();
		
		if(list.size() < 1) return gson.toJson(null);
		
		int idx_imgList = 0;
	
		for(int i = 0; i < list.size(); i++) {
		
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
	

	//성장일기 추가 
	@ResponseBody
	@RequestMapping(value = "/share.sn", produces="application/json;charset=UTF-8")
	public String sns_share(String vo, HttpSession session, HttpServletRequest req) throws Exception {
		System.out.println("snsShare접근");
		GrowthVO Imgvo = gson.fromJson(vo, GrowthVO.class);
		ArrayList<MultipartFile> fileList = new ArrayList<MultipartFile>();
		int file_size = Integer.parseInt( req.getParameter("file_size")+"" ); 
		MultipartRequest mreq = (MultipartRequest) req;
		for (int i = 0; i < file_size; i++) {
			MultipartFile file =mreq.getFile("file"+i);
			fileList.add(file);
		}
		if(fileList.size() > 0) {
			for(int i =0; i < fileList.size(); i++) {
				System.out.println(Imgvo.getBaby_id());
				String server_path = "http://" + getLocalAddr + req.getContextPath() + "/resources/";
				Imgvo.setImgList(server_path + common.fileUpload("gro", mreq.getFile("file"+i), session));
				Imgvo.setFilename(fileList.get(i).getOriginalFilename());
				Imgvo.setB_id(Imgvo.getBaby_id());
			}
		}else {
			System.out.println("파일 없음");
		}	
		String imgsns = gson.toJson(dao.snsInsert(Imgvo));
		//결과 볼려공
		System.out.println(imgsns);
		return imgsns;
		
	}

}
