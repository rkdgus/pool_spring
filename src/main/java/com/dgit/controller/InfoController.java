 package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/info")
public class InfoController {
	
private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String info(String title,Model model){
		logger.info("=================info Get====================");
		switch (title) {
		case "info":
			title = "시설안내";
			break;
		case "techer":
			title = "강사소개";
			break;
		case "road":
			title = "오시는길";
			break;
		default:
			break;
		}
		model.addAttribute("title", title);
		
		
		return "info/info";
	} 
}
