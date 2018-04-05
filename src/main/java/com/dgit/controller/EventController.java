package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/event")
public class EventController {
	
private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String event(){
		logger.info("=================event Get====================");
		return "event/event";
	}
} 
