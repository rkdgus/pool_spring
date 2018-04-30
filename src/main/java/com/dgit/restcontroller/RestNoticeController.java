package com.dgit.restcontroller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.ClassVO;
import com.dgit.domain.NoticeBoardVO;
import com.dgit.service.ClassService;
import com.dgit.service.NoticeBoardService;

@RestController
@RequestMapping("/notice/*")
public class RestNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(RestNoticeController.class);
	@Autowired
	private NoticeBoardService service;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ResponseEntity<List<NoticeBoardVO>> getNoticeList(){
		logger.info("GET classList");
		ResponseEntity<List<NoticeBoardVO>> entity = null;
		
		try{
			List<NoticeBoardVO> lists = service.selectByAll(0);
		
			entity = new ResponseEntity<List<NoticeBoardVO>>(lists,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<NoticeBoardVO>>(HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/read",method=RequestMethod.GET)
	public ResponseEntity<NoticeBoardVO> getNoticeListRead(int nno){
		logger.info("GET getNoticeListRead");
		ResponseEntity<NoticeBoardVO> entity = null;
		
		try{
			NoticeBoardVO lists = service.read(nno);
		
			entity = new ResponseEntity<NoticeBoardVO>(lists,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<NoticeBoardVO>(HttpStatus.OK);
		}
		
		return entity;
	}
	

}
