package com.dgit.restcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.QnaBoardVO;
import com.dgit.service.QnaBoardService;

@RestController
@RequestMapping("/restQna/*")
public class QnaBoardController {
	
	@Autowired
	QnaBoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(QnaBoardController.class);
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ResponseEntity<String> storeQna(QnaBoardVO vo){
		logger.info("============== qna insert ===========");
		ResponseEntity<String> entity = null;
		try{
			service.create(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
