package com.dgit.restcontroller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClassBoardService;
import com.dgit.service.ClassService;

@RestController
@RequestMapping("/restclassboard/*")
public class RestClassBoardController {
	private static final Logger logger = LoggerFactory.getLogger(RestClassBoardController.class);
	@Autowired
	private ClassService service;
	
	@Autowired
	private ClassBoardService serviceBoard;
	
	@RequestMapping(value="/classlist",method=RequestMethod.GET)
	public ResponseEntity<List<ClassVO>> getClasslist(String time){
		logger.info("GET classList");
		ResponseEntity<List<ClassVO>> entity = null;
		
		try{
			List<ClassVO> lists = service.selectByTime(time);
			entity = new ResponseEntity<List<ClassVO>>(lists,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<ClassVO>>(HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping(value="/classlist",method=RequestMethod.POST)
	public ResponseEntity<List<ClassVO>> postClasslist(String time){
		logger.info("POST classList");
		ResponseEntity<List<ClassVO>> entity = null;
		
		try{
			List<ClassVO> lists = service.selectByTime(time);
			entity = new ResponseEntity<List<ClassVO>>(lists,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<ClassVO>>(HttpStatus.OK);
		}
		return entity;
	}
	@RequestMapping(value="/classlist2",method=RequestMethod.POST)
	public ResponseEntity<ClassVO> postClasslist2(String time,String level){
		logger.info("POST classList2");
		ResponseEntity<ClassVO> entity = null;
		
		try{
			ClassVO vo = service.selectByTimeLevel(time, level);
			entity = new ResponseEntity<ClassVO>(vo,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<ClassVO>(HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping(value="/classboard",method=RequestMethod.GET)
	public ResponseEntity<List<ClassBoardVO>> classboard(int cno,SearchCriteria cri){
		logger.info("get classboard");
		ResponseEntity<List<ClassBoardVO>> entity = null;
		
		try{
			List<ClassBoardVO> lists = serviceBoard.selectByCno(cno, cri);
			entity = new ResponseEntity<List<ClassBoardVO>>(lists,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<ClassBoardVO>>(HttpStatus.OK);
		}
		return entity;
	} 
}
