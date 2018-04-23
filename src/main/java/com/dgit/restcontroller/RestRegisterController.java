package com.dgit.restcontroller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.MemberVO;
import com.dgit.domain.RegisterVO;
import com.dgit.service.MemberService;
import com.dgit.service.RegisterService;

@RestController
@RequestMapping("/restregister/*")
public class RestRegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RestRegisterController.class);
	@Autowired
	private RegisterService service;
	
	@Autowired
	private MemberService mservice;
	
	
	
	@RequestMapping(value="/memberList",method=RequestMethod.GET)
	public ResponseEntity<List<MemberVO>> getClasslist(int cno){
		logger.info("GET memberList");
		ResponseEntity<List<MemberVO>> entity = null;
		HashMap<String, Object> map = new HashMap<>();
		
		
		try{
			List<MemberVO> lists= mservice.selectRegisterMember(cno);
			
			entity = new ResponseEntity<List<MemberVO>>(lists,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<MemberVO>>(HttpStatus.OK);
		}
		
		return entity;
	}
	

}
