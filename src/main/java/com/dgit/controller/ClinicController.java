package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.ClinicVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClinicService;

@Controller
@RequestMapping("/clinic")
public class ClinicController {
	private static final Logger logger = LoggerFactory.getLogger(ClinicController.class);
	
	@Autowired
	public ClinicService service;
	@RequestMapping(value = "clinic", method = RequestMethod.GET)
	public void getClassboard() {
		logger.info("=================clinic Get====================");

	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ResponseEntity<List<ClinicVO>> list(SearchCriteria cri, String type) {
		ResponseEntity<List<ClinicVO>> entity = null;
		
		try{
			cri.setSearchType(type);
			List<ClinicVO> lists = service.list(cri);
			entity = new ResponseEntity<>(lists,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.OK);
		}
		return entity;
	}
}
