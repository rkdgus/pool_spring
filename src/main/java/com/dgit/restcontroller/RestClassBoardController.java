package com.dgit.restcontroller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.ClassreplyVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClassBoardService;
import com.dgit.service.ClassService;

@RestController
@RequestMapping("/restclassboard/*")
public class RestClassBoardController {
	private static final Logger logger = LoggerFactory.getLogger(RestClassBoardController.class);
	@Autowired
	private ClassService service;
	
	@Autowired
	private ClassBoardService serviceBoard;
	
	private String innerUploadPath = "/resources/upload";
	@RequestMapping(value="/classlist",method=RequestMethod.GET)
	public ResponseEntity<List<ClassVO>> getClasslist(String time){
		logger.info("GET classList");
		ResponseEntity<List<ClassVO>> entity = null;
		
		try{
			List<ClassVO> lists = service.selectByTime(time);
			entity = new ResponseEntity<List<ClassVO>>(lists,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<ClassVO>>(HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping(value="/classlist",method=RequestMethod.POST)
	public ResponseEntity<List<ClassBoardVO>> postClasslist(String time,String level,SearchCriteria cri){
		logger.info("POST classList");
		ResponseEntity<List<ClassBoardVO>> entity = null;
		cri.setPerPageNum(10);
		try{
			ClassVO vo = service.selectByTimeLevel(time, level);
			List<ClassBoardVO> list = serviceBoard.selectByCno(vo.getCno(), cri);
			entity = new ResponseEntity<List<ClassBoardVO>>(list,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<ClassBoardVO>>(HttpStatus.OK);
		}
		return entity;
	}
	@RequestMapping(value="/classboardlist",method=RequestMethod.POST)
	public ResponseEntity<List<ClassBoardVO>> postClasslist2(int cno,SearchCriteria cri){
		logger.info("POST classboardlist");
		ResponseEntity<List<ClassBoardVO>> entity = null;
		cri.setPerPageNum(10);
		try{
			List<ClassBoardVO> list = serviceBoard.selectByCno(cno, cri);
			entity = new ResponseEntity<List<ClassBoardVO>>(list,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<ClassBoardVO>>(HttpStatus.OK);
		}
		return entity;
	}
	@RequestMapping(value="/read",method=RequestMethod.POST)
	public ResponseEntity<ClassBoardVO> getRead(int bno){
		logger.info("GET Read");
		ResponseEntity<ClassBoardVO> entity = null;
		try{
			ClassBoardVO vo = serviceBoard.read(bno);
			entity = new ResponseEntity<ClassBoardVO>(vo,HttpStatus.OK);
			return entity;
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<ClassBoardVO>(HttpStatus.OK);
			return entity;
		}
	}
	
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public ResponseEntity<String> upload(HttpServletRequest request,MultipartFile uploaded_file) throws IOException{
		logger.info("upload ");
		ResponseEntity<String> entity = null;
		String root_path = request.getSession().getServletContext().getRealPath("/");
		File dirPath = new File(root_path+"/"+innerUploadPath+"/classboard");
		String r = request.getContextPath();
		String projectName = r.substring(r.lastIndexOf("/"),r.length());
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		String filePath = projectName +innerUploadPath+"/classboard/";
		
		String savedName = uploaded_file.getOriginalFilename();
		File target = new File(root_path+innerUploadPath+"/classboard", savedName);
		FileCopyUtils.copy(uploaded_file.getBytes(), target);
		
		logger.info(uploaded_file.getOriginalFilename());
		
		return entity;   
	}
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ResponseEntity<String> insert(ClassBoardVO vo,String time, String level,String imgPathcheck){
		logger.info("==============insert=============");
		ResponseEntity<String> entity = null;
		try{
			ClassVO cls= service.selectByTimeLevel(time, level);
			vo.setCno(cls.getCno());
			if(imgPathcheck !=null){
				vo.setImgpath(imgPathcheck);
			}
			serviceBoard.create(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping(value="/readreply",method=RequestMethod.POST)
	public ResponseEntity<List<ClassreplyVO>> readreply(int bno){
		ResponseEntity<List<ClassreplyVO>> entity = null;
		
		try{
			List<ClassreplyVO> list = serviceBoard.replySelectByBno(bno);
			entity = new ResponseEntity<List<ClassreplyVO>>(list,HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<ClassreplyVO>>(HttpStatus.OK);
		}
		return entity;
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public ResponseEntity<String> delete(int bno){
		logger.info("==============delete=============");
		ResponseEntity<String> entity = null;
		try{
			serviceBoard.remove(bno);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("fail",HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping(value="/insertreply",method=RequestMethod.POST)
	public ResponseEntity<List<ClassreplyVO>> insertreply(ClassreplyVO vo){
		logger.info("==============insertreply=============");
		ResponseEntity<List<ClassreplyVO>> entity = null;
		try{
			serviceBoard.createReply(vo);
			List<ClassreplyVO> list =serviceBoard.replySelectByBno(vo.getBno());
			entity = new ResponseEntity<List<ClassreplyVO>>(list,HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<ClassreplyVO>>(HttpStatus.OK);
		}
		return entity;
	}
}
