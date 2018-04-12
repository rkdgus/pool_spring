package com.dgit.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/adminClinic/*")
public class AdminClinicController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Resource(name = "uploadPath")
	private String outUploadPath;
	
	@RequestMapping(value="/adminClinic",method=RequestMethod.GET)
	public void adminQna(){
		logger.info("======= adminClinic get ==========");
	}
}
