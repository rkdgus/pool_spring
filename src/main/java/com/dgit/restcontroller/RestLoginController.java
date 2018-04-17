package com.dgit.restcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.MemberVO;
import com.dgit.service.MemberService;

@RestController
@RequestMapping("/restLogin/*")
public class RestLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestLoginController.class);
	
	@Autowired
	MemberService mservice;
	
	@RequestMapping(value="loginId",method=RequestMethod.POST)
	public ResponseEntity<String> loginId(String id){
		ResponseEntity<String> entity = null;
		logger.info("=================idCheck post====================");
	
		try {
			MemberVO vo  = mservice.findMemberId(id);
			if(vo==null){
			
				entity = new ResponseEntity<String>("no member",HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("member",HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value="loginId",method=RequestMethod.GET)
	public ResponseEntity<String> loginIdGET(String id){
		ResponseEntity<String> entity = null;
		logger.info("=================idCheck GET====================");
	
		try {
			MemberVO vo  = mservice.findMemberId(id);
			if(vo==null){
			
				entity = new ResponseEntity<String>("no member",HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("member",HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
