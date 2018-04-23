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
import com.dgit.service.ClassService;

@RestController
@RequestMapping("/restclassinfo/*")
public class RestClassInfoController {
	private static final Logger logger = LoggerFactory.getLogger(RestClassInfoController.class);
	@Autowired
	private ClassService service;
	
	@RequestMapping(value="/classlist",method=RequestMethod.GET)
	public ResponseEntity<List<ClassVO>> getClasslist(int tno){
		logger.info("GET classList");
		ResponseEntity<List<ClassVO>> entity = null;
		
		try{
			List<ClassVO> lists = service.selectByTno(tno);
			entity = new ResponseEntity<List<ClassVO>>(lists,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<ClassVO>>(HttpStatus.OK);
		}
		
		return entity;
	}
	

}
