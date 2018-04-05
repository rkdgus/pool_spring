 package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/info")
public class InfoController {
	
private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String info(){
		logger.info("=================info Get====================");
		return "info/info";
	} 
}
