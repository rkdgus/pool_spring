package com.dgit.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.MemberVO;
import com.dgit.domain.TeacherVO;
import com.dgit.service.MemberService;
import com.dgit.service.TeacherService;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MemberService service;
	@Autowired
	private TeacherService serviceT;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public void getLogin(){
		logger.info("=================login Get====================");
	}
	
	@RequestMapping(value="/auther")
	public void auther(){
		logger.info("=================auther====================");
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public void postLogin(HttpSession session,String id,String pw,String title){
		logger.info("=================login post====================");
		System.out.println(title);
		if(title.equals("회원")){
			MemberVO vo  = new MemberVO();
			vo.setId(id);
			vo.setPw(pw);
			MemberVO m = service.selectMember(vo);
			m.setTitle("회원");
			session.setAttribute("login", m);
			
		}else if(title.equals("관리자")){
			TeacherVO vo = new TeacherVO();
			vo.setId(id);
			vo.setPw(pw);
			TeacherVO t = serviceT.selectTeacher(vo);
			session.setAttribute("login", t);
		}
		
		
	}
	
	@RequestMapping(value="/member",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<MemberVO> postLogin(String id,String pw){
		logger.info("=================member Post====================");
		ResponseEntity<MemberVO> entity = null;
		
		try {
			MemberVO mem = new MemberVO();
			mem.setId(id);
			mem.setPw(pw);
			MemberVO vo  = service.selectMember(mem);
			
			entity = new ResponseEntity<MemberVO>(vo,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/memberId",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<MemberVO> idCheck(String id){
		logger.info("=================id check Post====================");
		ResponseEntity<MemberVO> entity = null;
		
		try {
			MemberVO vo  = service.findMemberId(id);
			entity = new ResponseEntity<MemberVO>(vo,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/teacherId",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<TeacherVO> tIdCheck(String id){
		logger.info("================= teacher id check Post====================");
		ResponseEntity<TeacherVO> entity = null;
		
		try {
			TeacherVO vo  = serviceT.findTeacherId(id);
			entity = new ResponseEntity<TeacherVO>(vo,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<TeacherVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	@RequestMapping(value="/teacher",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<TeacherVO> tlogin(TeacherVO vo){
		logger.info("================= teacher login Post====================");
		ResponseEntity<TeacherVO> entity = null;
		
		try {
			TeacherVO t  = serviceT.selectTeacher(vo);
			entity = new ResponseEntity<TeacherVO>(t,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<TeacherVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	
	}
	
	@RequestMapping(value="/logOut")
	public String logOut(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public void search(){
		logger.info("=================search Get====================");
	}
	
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public String searchPost(String name,String email,Model model){
		logger.info("=================search POST====================");
		
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setEmail(email);
		vo = service.findMember(vo);
		
		model.addAttribute("vo",vo);
		
		return "login/result";
	}
	
	
}
