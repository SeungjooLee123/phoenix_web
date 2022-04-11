package com.phoenix.bss;




import java.util.ArrayList;

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

import sns.GrowthVO;
import sns.SnsDAO;

@Controller
public class SnsController {
	Gson gson = new GsonBuilder().setDateFormat("MM-dd").create();
	@Autowired SnsDAO dao;
	@Autowired CommonService common;
	private final String getLocalAddr = "121.148.239.238:5524";
	
	//
	
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
	
	//수정할 성장일기 게시물 선택
	@ResponseBody
	@RequestMapping(value = "/groselect.sn", produces="application/json;charset=UTF-8")
	public String gro_select(HttpServletRequest req, HttpSession session) {
		System.out.println("groSelect접근");
		int no = Integer.parseInt(req.getParameter("no")+"");
		System.out.println(no);
		//수정할 글 목록 가져옴 
		List<GrowthVO> testlist = dao.select_imgs(no);
		System.out.println(testlist.get(0).getGro_img());
		
		//한 VO로 만듬
		GrowthVO testvo = testlist.get(0);
		for(int i=0; i<testlist.size(); i++) {
			testvo.setImgList(testlist.get(i).getGro_img());
		}
		return gson.toJson(testvo, GrowthVO.class);
	}
	
	//선택된 게시물 업데이트
	@ResponseBody
	@RequestMapping(value = "/update.sn", produces="application/json;charset=UTF-8")
	public String gro_update(HttpServletRequest req, HttpSession session) {
		System.out.println("groUpdate접근");
		String testdata = req.getParameter("vo");
		GrowthVO test = gson.fromJson(testdata, GrowthVO.class);
		for( int j =0; j<test.getImgList().size(); j++) {
			System.out.println(test.getImgList().get(j));
		}
		
		System.out.println(test.getGro_content()); 
		System.out.println(test.getBaby_id());
		
		//이전 파일 삭제
		List<GrowthVO> img_list =  dao.select_imgs(test.getGro_no());
		for(int i=0; i < img_list.size(); i++) {
			System.out.println(img_list.get(i).getGro_img());
			String testStr = img_list.get(i).getGro_img();
			common.fileDelete(testStr, session);
		}
		
		//DB에서 지우기
		dao.del_img(test.getGro_no()); 
		
		//게시글 업데이트 
		test = dao.text_update(test);
		System.out.println(test.getGro_no());
		System.out.println("업데이트");
		System.out.println(test.getBaby_id());
		//찍힘
	

		//사진 다시 세팅
		ArrayList<MultipartFile> fileList = new ArrayList<MultipartFile>();
		int file_size = Integer.parseInt( req.getParameter("file_size")+"" ); 
		MultipartRequest mreq = (MultipartRequest) req;
		for (int i = 0; i < file_size; i++) {
			MultipartFile file =mreq.getFile("file"+i);
			fileList.add(file);
		}
		if(fileList.size() > 0) {
			for(int i =0; i < fileList.size(); i++) {
				System.out.println(test.getBaby_id());
				//찍힘 -> 돌아오면 null
				String server_path = "http://" + getLocalAddr + req.getContextPath() + "/resources/";
				test.setImgList(server_path + common.fileUpload("gro", mreq.getFile("file"+i), session));
				test.setFilename(fileList.get(i).getOriginalFilename());
				test.setBaby_id(test.getB_id());
				test.setB_id(test.getBaby_id());
				
				System.out.println("들어감");
			}
		}else {
			System.out.println("파일 없음");
		}	
		
		List<GrowthVO> list =  dao.insertall(test);
		System.out.println(list.get(0).getGro_no());
		GrowthVO setvo = list.get(0);
		for(int i =0; i <list.size(); i++) {
			setvo.setImgList(list.get(i).getGro_img());
		}
		String data = gson.toJson(setvo);
		return data;
	}
	@ResponseBody
	@RequestMapping(value = "/content.sn", produces="application/json;charset=UTF-8")
	public String gro_text(HttpServletRequest req) {
		System.out.println("groText접근");
		String testdata = req.getParameter("vo");
		GrowthVO vo = gson.fromJson(testdata, GrowthVO.class);
		System.out.println(vo.getGro_no());
		System.out.println(vo.getGro_content());
		
		vo =  dao.text_update(vo);
		String data =gson.toJson(vo);
		System.out.println(data);
		return data;
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
