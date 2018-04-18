package com.dgit.restcontroller;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public ResponseEntity<MemberVO> loginId(String id,String pw,HttpSession session){
		ResponseEntity<MemberVO> entity = null;
		logger.info("=================idCheck post====================");
	
		try {
			MemberVO vo  = mservice.findMemberId(id);
			if(vo==null){
				MemberVO no = new MemberVO();
				no.setMno(-1);
				entity = new ResponseEntity<MemberVO>(no,HttpStatus.OK);
			}else{
				
				MemberVO m =new MemberVO();
				m.setId(id);
				m.setPw(pw);
				MemberVO find = mservice.selectMember(m);
				if(find == null){
					MemberVO noPw = new MemberVO();
					noPw.setMno(-2);
					entity = new ResponseEntity<MemberVO>(noPw,HttpStatus.OK);
				}else{
					find.setTitle("회원");
					find.setPw("");
					entity = new ResponseEntity<MemberVO>(find,HttpStatus.OK);
					session.setAttribute("androidLogin", find);
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value="loginId",method=RequestMethod.GET)
	public ResponseEntity<String> loginIdGET(String id,String pw){
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
