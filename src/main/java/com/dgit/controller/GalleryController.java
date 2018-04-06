package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	
private static final Logger logger = LoggerFactory.getLogger(GalleryController.class);
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String gallery(){
		logger.info("=================gallery Get====================");
		return "gallery/gallery";
	}
} 
