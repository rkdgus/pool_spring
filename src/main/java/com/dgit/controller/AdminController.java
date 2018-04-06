package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.GalleryVO;
import com.dgit.service.GalleryService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	GalleryService galleryService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String admin(){
		logger.info("=================admin Get====================");
		return "admin/admin";
	}
	
	@RequestMapping(value="/gallery",method=RequestMethod.GET)
	public String gallery(){
		logger.info("=================gallery Get====================");
		return "admin/gallery_admin";
	}
	
	@RequestMapping(value="/gallery",method=RequestMethod.POST)
	public String galleryPost(List<MultipartFile> imageFile,GalleryVO vo){
		logger.info("=================gallery post====================");
		
		
		
		return "admin/gallery_admin";
	}
	

} 
