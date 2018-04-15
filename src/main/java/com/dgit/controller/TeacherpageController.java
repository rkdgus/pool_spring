package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.TeacherVO;
import com.dgit.service.TeacherService;

@Controller
@RequestMapping(value="/teacherpage/*")
public class TeacherpageController {
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherpageController.class);
	
	@Autowired
	TeacherService service;
	
	@RequestMapping(value="/teacherMypage",method=RequestMethod.GET)
	public void teacherpage(){
		logger.info("============== teacher mypage get ========");
	}
	
	@RequestMapping(value="/teacherInfo",method=RequestMethod.GET)
	public void teacherInfo(){
		logger.info("============== teacher mypage teacherInfo get ========");
	}
	
	@RequestMapping(value="/updateteacherStep1",method=RequestMethod.GET)
	public void updateteacherStep1(){
		logger.info("============== teacher mypage updateteacherStep1 get ========");
	}
	
	@RequestMapping(value="/updateTeacher",method=RequestMethod.GET)
	public void updateTeacher(){
		logger.info("============== teacher mypage updateteacher get ========");
	}
	
	@RequestMapping(value="/updatePwStep1",method=RequestMethod.GET)
	public void updatePwStep1(){
		logger.info("============== teacher mypage updatePwStep1 get ========");
	}
	
	@RequestMapping(value="/updatePw",method=RequestMethod.GET)
	public void updatePwget(){
		logger.info("============== teacher mypage updatePw get ========");
	}
	
	@RequestMapping(value="/updatePw",method=RequestMethod.POST)
	public String updatePw(String id, String pw){
		logger.info("============== teacher mypage updatePw post ========");
		TeacherVO vo = new TeacherVO();
		vo.setId(id);
		vo.setPw(pw);
		service.updatePw(vo);
		return "redirect:/teacherpage/updatePwStep1";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPw",method=RequestMethod.POST)
	public ResponseEntity<String> checkPw(String id,String pw){
		ResponseEntity<String> entity = null;
		
		try{
			TeacherVO vo = new TeacherVO();
			vo.setId(id);
			vo.setPw(pw);
			TeacherVO t = service.selectTeacher(vo);
			if(t!=null){
				entity  = new ResponseEntity<String>("match",HttpStatus.OK);
			}else{
				entity  = new ResponseEntity<String>("notMatch",HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
