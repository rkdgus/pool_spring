package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/clinic")
public class ClinicController {
private static final Logger logger = LoggerFactory.getLogger(ClinicController.class);
	
	@RequestMapping(value="clinic",method=RequestMethod.GET)
	public void getClassboard(){
		logger.info("=================clinic Get====================");
		
	}
}
