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

import com.dgit.domain.Criteria;
import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;
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
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ResponseEntity<List<QnaBoardVO>> storeQnaList(String id,SearchCriteria cri){
		logger.info("============== qna insert ===========");
		ResponseEntity<List<QnaBoardVO>> entity = null;
		try{
			List<QnaBoardVO> list=service.selectbyIdQna(id, cri);
			
			entity = new ResponseEntity<List<QnaBoardVO>>(list,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<QnaBoardVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
