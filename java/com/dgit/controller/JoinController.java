package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/join/*")
public class JoinController {
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value="/joinStep1",method=RequestMethod.GET)
	public void getJoin(){
		logger.info("=========joinStep1 get==========");
	}
}  
