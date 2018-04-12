package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.SearchCriteria;

@Controller
@RequestMapping("/classtime")
public class ClassTimeController {
	private static final Logger logger = LoggerFactory.getLogger(ClassTimeController.class);
	
	@RequestMapping(value="classtime",method=RequestMethod.GET)
	public void getClassboard(){
		logger.info("=================classtime Get====================");
		
	}
}
