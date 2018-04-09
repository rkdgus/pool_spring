package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value="/teacherMypage",method=RequestMethod.GET)
	public void tMypage(){
		logger.info("================teacerh mypage get==============");
	}
	
	
	@RequestMapping(value="/memberMypage",method=RequestMethod.GET)
	public void mMypage(){
		logger.info("================member mypage get==============");
	}
	
	@RequestMapping(value="/attendance",method=RequestMethod.GET)
	public void attendance(){
		logger.info("================member  attendance mypage get==============");
	}
}
