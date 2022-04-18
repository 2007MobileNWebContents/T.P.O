package com.kh.tpo.sight.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.google.gson.Gson;
import com.kh.tpo.sight.common.Pagination;
import com.kh.tpo.sight.domain.PageInfo;
import com.kh.tpo.sight.domain.Sight;
import com.kh.tpo.sight.domain.SightReview;
import com.kh.tpo.sight.service.SightService;

@Controller
public class SightController {
	
	@Autowired
	private ApiController ac;
	
	@Autowired
	private SightService sService;
	
//  // sightList주소 불러오고, 페이징처리까지
    @RequestMapping(value="sightList.tpo", method=RequestMethod.GET)
     public ModelAndView sightList (ModelAndView mv,
           @RequestParam(value="page", required=false)Integer page, Model model) throws Exception{
       int currentPage = (page!=null)? page:1;
       int listCount = sService.getListCount();
       PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
       System.out.println(pi.toString());
       ArrayList<Sight> sList = sService.selectSightList(pi);
       int parking =0;
       int baby = 0;
       int pet =0;
       HashMap<String,Integer> chkValue = new HashMap<String, Integer>();
		  chkValue.put("parking", parking);
		  chkValue.put("babyCar", baby);
		  chkValue.put("pet", pet);
       // DB에 저장된 값이 있는 경우
          if(!sList.isEmpty()) {
             mv.addObject("sList", sList);
             mv.addObject("pi", pi);
             mv.addObject("chkValue", chkValue);
             mv.setViewName("sight/sightList");;
          }
          else {
             mv.setViewName("common/errorPage");
          }
          return mv;
       }
	
	// sightList주소 불러오고, 페이징처리까지(버튼눌럿을 때)
	  @RequestMapping(value="sightChkList.tpo", method=RequestMethod.GET)
		public ModelAndView sightList (ModelAndView mv,
												@RequestParam(value="page", required=false)Integer page, 
												Model model,
												Integer parking,
												Integer baby,
												Integer pet,
												String sLocation) throws Exception{
		  // 지역으로 검색을 안했을 때
//		  System.out.println(page);
//		  System.out.println(parking);
//		  System.out.println(baby);
//		  System.out.println(pet);
//		  System.out.println(sName);
	 if(sLocation=="" || sLocation==null) {
		  if(parking==null) {
			  parking=0;
		  }
		  if(baby==null) {
			  baby=0;
		  }
		  if(pet==null) {
			  pet=0;
		  }
		  sLocation = "";
		  HashMap<String,Object> chkValue = new HashMap<String, Object>();
		  chkValue.put("parking", parking);
		  chkValue.put("babyCar", baby);
		  chkValue.put("pet", pet);
		  chkValue.put("sLocation", sLocation);
		  int currentPage = (page!=null)? page:1;
		  int listCount = sService.sightChkCount(chkValue);
		  PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		  ArrayList<Sight> sList = sService.sightChkList(pi,chkValue);
			  // DB에 저장된 값이 있는 경우
			  if(!sList.isEmpty()) {
				  mv.addObject("sList", sList);
				  mv.addObject("pi", pi);		
				  mv.addObject("chkValue", chkValue);
				  mv.setViewName("sight/sightList");;
			  }
			  else {
				  // 추후 수정
				  mv.addObject("sList", sList);
				  mv.addObject("chkValue", chkValue);
				  mv.setViewName("sight/sightList");
			  }
			  return mv;
		 }else {
			 if(parking==null) {
				  parking=0;
			  }
			  if(baby==null) {
				  baby=0;
			  }
			  if(pet==null) {
				  pet=0;
			  }
			  HashMap<String,Object> chkValue = new HashMap<String, Object>();
			  chkValue.put("parking", parking);
			  chkValue.put("babyCar", baby);
			  chkValue.put("pet", pet);
			  chkValue.put("sLocation", sLocation);
			  int currentPage = (page!=null)? page:1;
			  int listCount = sService.sightChkCount(chkValue);
			  PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			  ArrayList<Sight> sList = sService.sightChkList(pi,chkValue);
				  // DB에 저장된 값이 있는 경우
				  if(!sList.isEmpty()) {
					  mv.addObject("sList", sList);
					  mv.addObject("pi", pi);		
					  mv.addObject("chkValue", chkValue);
					  mv.setViewName("sight/sightList");;
				  }
				  else {
					  // 추후 수정
					  mv.addObject("sList", sList);
					  mv.addObject("chkValue", chkValue);
					  mv.setViewName("sight/sightList");
				  }
			 return mv;
		 }
	  }
		  
		  @RequestMapping(value="selectSight.tpo",method=RequestMethod.GET)
		  public ModelAndView selectSight(ModelAndView mv,HttpServletRequest request) {
			  Sight sight = new Sight();
			  ArrayList<SightReview> rList = null;
//			  String sNo = request.getParameter("sno");
			  int sightNumber = Integer.parseInt(request.getParameter("sno"));
			  
			  
			  if(sService.selectSight(sightNumber) == null ){
				  ac.getSightDetail(sightNumber);
				  mv.addObject("msg","다시 시도해 주십시오");
				  mv.setViewName("common/errorPage");

			  } else {
				  sight=sService.selectSight(sightNumber);
				  if(sService.selectReviewList(sightNumber)!= null){
					  rList = sService.selectReviewList(sightNumber);
					  mv.addObject("sight", sight)
					  .addObject("review", rList)
					  .setViewName("sight/sightDetail");
				  }else {
					  sight=sService.selectSight(sightNumber);
					  rList = sService.selectReviewList(sightNumber);
					  mv.addObject("sight", sight)
					  .addObject("review", rList)
					  .setViewName("sight/sightDetail");
				  }
			  }
				  return mv;
			  }

	  @RequestMapping(value="sightReviewWrieteForm.tpo" , method= RequestMethod.GET )
	  public ModelAndView writeReview(ModelAndView mv, String sNo){
		  System.out.println(sNo);
		  mv.addObject("sNo", sNo)
		  .setViewName("sight/reviewWriteForm");
		  
		  return mv;
	  }
	  
	  
	  @RequestMapping(value="insertReview.tpo", method=RequestMethod.POST)
	  public ModelAndView  insertReview (SightReview review, ModelAndView mv, 
			  @RequestParam(name="uploadFile", required=false)MultipartFile uploadFile, HttpServletRequest request  ) {
		  
		  String sNo = request.getParameter("sNo");
		  if(!uploadFile.getOriginalFilename().equals("")) {
			  String filePath = saveFile(uploadFile, request);
			  if(filePath != null) {
				  review.setReviewPicture(uploadFile.getOriginalFilename());
					  
				  }
			  }
		  
		  int result = sService.insertReview(review);
		  if(result>0) {
			  mv.addObject("sno",sNo).setViewName("redirect:selectSight.tpo");
		  }else {
			  mv.addObject("msg", "리뷰 등록 실패").setViewName("redirect:common/errorPage");
		  }
		  return mv;
	  }

	  
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\reviewuploadfiles";
			// 저장 폴더 선택
			File folder = new File(savePath);
			// 만약 폴더가 없을경우 자동 생성
			if(!folder.exists()) {
				folder.mkdir();
			}
			String filePath = folder + "\\" + file.getOriginalFilename();
			// 파일저장
			
			try {
				file.transferTo(new File(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return filePath;
		}
		
		@RequestMapping(value="deleteReview.tpo", method=RequestMethod.GET)
		public ModelAndView deleteReview ( ModelAndView mv, HttpServletRequest request) {
			// 해당 명소 리뷰 번호
			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			// 해당 명소에 대한 리뷰 삭제
			int result = sService.deleteReview(reviewNo);
			// 해당 명소 번호
			int sNo = Integer.parseInt(request.getParameter("sNo"));
			if(result>0) {
				  mv.addObject("sno",sNo).setViewName("redirect:selectSight.tpo");
			  }else {
				  mv.addObject("msg", "리뷰 등록 실패").setViewName("redirect:common/errorPage");
			  }
			  return mv;
		}
		public void deleteFile(String fileName, HttpServletRequest request) {
			// 파일 저장 경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			String deletePath = root + "\\reviewuploadfiles";
			// 삭제할 파일 경로를 통한 파일 객체생성
			File deleteFile = new File(deletePath+"\\"+fileName);
			// 해당 파일이 존재할 경우 삭제
			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}
		@RequestMapping(value="updateReviewView.tpo", method=RequestMethod.GET)
		public ModelAndView updateReviewView (ModelAndView mv, int reviewNo, HttpServletRequest request ) {
			mv.addObject("review", sService.selectReview(reviewNo))
			.setViewName("sight/reviewUpdateForm");
			
			return mv;
		}
		
		@RequestMapping(value="updateReview.tpo", method=RequestMethod.POST)
		public ModelAndView reviewUpdate (ModelAndView mv, SightReview review, HttpServletRequest request, MultipartFile reloadFile) {
			System.out.println(review);
			String sNo = request.getParameter("sNo");
			// 새로 업로드 된 파일이 있을경우
			if (reloadFile != null && !reloadFile.isEmpty()) {
				// 기존 업로드된 파일이 있을경우
				if(review.getReviewPicture() != null) {
					deleteFile (review.getReviewPicture(), request);
				}
				// 새로 업로드 된 파일 삭제
				String  renameFileName= saveFile(reloadFile, request);
				// 새로  업로드 된 파일이 잘 저장되어있다면
				// DB 에 저장하도록세팅
				if(renameFileName != null) {
					review.setReviewPicture(reloadFile.getOriginalFilename());
					//review.setReviewPicture(renameFileName);
				}
			}
			int result = sService.modifyReview(review);
			System.out.println(review);
			if(result>0) {
				mv.addObject("sno",sNo).setViewName("redirect:selectSight.tpo");
			}else {
				mv.addObject("msg", "리뷰 수정실패").setViewName("common/errorPage");
			}
			
			return mv;
		}
		
}

	    

