package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/classboard/*")
public class ClassBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClassBoardController.class);
	
	@RequestMapping(value="classboard")
	public void getClassboard(){
		logger.info("=================classBoard Get====================");
		
	}
}
