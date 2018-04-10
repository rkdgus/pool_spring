package com.dgit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Resource(name="uploadPath")
	private String outUploadPath;
	
	
	@RequestMapping(value="/qna",method=RequestMethod.GET)
	public void qna(){
		logger.info("==========qna get========");
	}
	
		@ResponseBody
	   @RequestMapping(value="/upload", method=RequestMethod.POST)   
	   public ResponseEntity<List<String>> getUpload(List<MultipartFile> fileList){
	      logger.info("=================gallery post====================");
	      ResponseEntity<List<String>> entity = null;
	      File dirPath = new File(outUploadPath);
	      
	      if (!dirPath.exists()) {
	         dirPath.mkdirs();
	      }
	      List<String> nameList = new ArrayList<>();
	      for(int i = 0; i<fileList.size();i++){
	         UUID uid = UUID.randomUUID();// 중복방지를 위하여 랜덤값 생성
	         String fileName = fileList.get(i).getOriginalFilename();
	       //  String type = "."+fileName.substring(fileName.lastIndexOf(".")+1,fileName.length()); 
	         String savedName = uid.toString() + "_"+ fileName ;
	         File target = new File(outUploadPath, savedName);
	         try {
	            FileCopyUtils.copy(fileList.get(i).getBytes(), target);
	            nameList.add(outUploadPath+savedName);
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      if(nameList.size() !=0){
	         entity = new ResponseEntity<List<String>>(nameList,HttpStatus.OK);
	      }else{
	         entity = new ResponseEntity<List<String>>(nameList,HttpStatus.OK);
	      }
	      return entity;
	   }
}
