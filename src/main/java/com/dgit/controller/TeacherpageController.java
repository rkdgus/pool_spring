package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/teacherpage/*")
public class TeacherpageController {
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherpageController.class);
	
	@RequestMapping(value="/teacherMypage",method=RequestMethod.GET)
	public void teacherpage(){
		logger.info("============== teacher mypage get ========");
	}
}
