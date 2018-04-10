package com.dgit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.QnaBoardVO;
import com.dgit.service.QnaBoardService;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Resource(name="uploadPath")
	private String outUploadPath;
	
	@Autowired
	QnaBoardService service;
	
	@RequestMapping(value="/qna",method=RequestMethod.GET)
	public void qna(){
		logger.info("==========qna get========");
	}
	
		@ResponseBody
	   @RequestMapping(value="/upload", method=RequestMethod.POST)   
	   public ResponseEntity<String> getUpload(List<MultipartFile> fileList) throws Exception{
	      logger.info("=================upload post====================");
	      ResponseEntity<String> entity = null;
	     
	      String imgPath = "";
	      for(int i = 0; i<fileList.size();i++){
	         
	         String filePath = outUploadPath+"qna/";
	         
	         try {
	        	String savedName =  UploadFileUtils.uploadFile(filePath, fileList.get(i).getOriginalFilename(),fileList.get(i).getBytes());
	           if((i+1) ==fileList.size()){
	        	   imgPath += filePath+savedName;
	           }else{
	        	   imgPath += filePath+savedName+",";
	           }
	           
	           
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      if(!imgPath.equals("")){
	         entity = new ResponseEntity<String>(imgPath,HttpStatus.OK);
	      }else{
	         entity = new ResponseEntity<String>(imgPath,HttpStatus.OK);
	      }
	      return entity;
	   }
		
		@RequestMapping(value = "/qnaContent",method=RequestMethod.POST)
		public String qnaInsert(QnaBoardVO vo){
			 logger.info("=================qna post====================");
			 logger.info(vo.toString());
			 service.create(vo);
			return "redirect:/";
		}
}
