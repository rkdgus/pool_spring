package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public void getLogin(){
		logger.info("=================login Get====================");
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public void PostLogin(){
		logger.info("=================login Post====================");
	}
}
