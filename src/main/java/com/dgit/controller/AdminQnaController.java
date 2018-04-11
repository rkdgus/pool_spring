package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.PageMaker;
import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.QnaBoardService;

@Controller
@RequestMapping("/adminQna/*")
public class AdminQnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminQnaController.class);
	
	@Autowired
	QnaBoardService service;
	
	@RequestMapping(value="/qna",method=RequestMethod.GET)
	public void adminQna(SearchCriteria cri,Model model){
		logger.info("======= admin qna get ==========");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countByAll());
		List<QnaBoardVO> list = service.selectByAll((cri.getPage()-1)*15);
		model.addAttribute("qna", list);
	}

}
