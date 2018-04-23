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
@RequestMapping("/restJoin/*")
public class RestJoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestJoinController.class);
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="/checkMno",method=RequestMethod.POST)
	public ResponseEntity<MemberVO> checkMno(int mno){
		
		logger.info("============ mno check post =======");
		ResponseEntity<MemberVO> entity = null;
		
		try{
			MemberVO m = service.selectMemberByMno(mno);
			if(m !=null){
				entity = new ResponseEntity<MemberVO>(m,HttpStatus.OK);
			}else{
				MemberVO no = new MemberVO();
				no.setMno(-1);
				entity = new ResponseEntity<MemberVO>(no,HttpStatus.OK);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/idCheck",method=RequestMethod.POST)
	public ResponseEntity<String> idCheck(String id){
		logger.info("============ id check post =======");
		ResponseEntity<String> entity =null;
		try{
			MemberVO m = service.findMemberId(id);
			if(m==null){
				entity = new ResponseEntity<String>("ok",HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("no",HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/signUp",method=RequestMethod.POST)
	public ResponseEntity<String> signUp(String id, String pw,int mno){
		ResponseEntity<String> entity = null;
		try{
			MemberVO vo  = new MemberVO();
			vo.setId(id);
			vo.setPw(pw);
			vo.setMno(mno);
			service.updateIdPw(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
