package com.dgit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.ClinicVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClinicService;

@Controller
@RequestMapping("/adminClinic/*")
public class AdminClinicController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private ClinicService service;
	
	@Resource(name = "uploadPath")
	private String outUploadPath;
	
	@RequestMapping(value="/adminClinic",method=RequestMethod.GET)
	public void adminQna(SearchCriteria cri,Model model){
		logger.info("======= adminClinic get ==========");
		List<ClinicVO> lists = service.list(cri);
		makePage(model,cri);
		model.addAttribute("lists",lists);
	}
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public void getinsert(SearchCriteria cri,Model model){
		
	}
	private void makePage(Model model,SearchCriteria cri){
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalcount = service.count(cri);
		pageMaker.setTotalCount(totalcount);
		model.addAttribute("pageMaker",pageMaker);
	}
}
