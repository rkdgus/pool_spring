package com.dgit.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.dgit.domain.PageMaker;
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
	public ResponseEntity<HashMap<String,Object>> postClasslist(String time,SearchCriteria cri){
		logger.info("POST classList");
		ResponseEntity<HashMap<String,Object>> entity = null;
		cri.setPerPageNum(25);
		try{
			List<ClassVO> lists = service.selectByTime(time);
			HashMap<String, Object> map = new HashMap<>();
			
			for(ClassVO vo : lists){
				logger.info("cno  =>" + vo.getCno());
				List<ClassBoardVO> list = new ArrayList<>();
				switch (vo.getLevel()) {
				case "초급":
					list = serviceBoard.selectByCno(vo.getCno(), cri);
					map.put("lists_0",list);
					break;
				case "중급":
					list = serviceBoard.selectByCno(vo.getCno(), cri);
					map.put("lists_1",list);
					break;
				case "고급":
					list = serviceBoard.selectByCno(vo.getCno(), cri);
					map.put("lists_2",list);
					break;
				case "상급":
					list = serviceBoard.selectByCno(vo.getCno(), cri);
					map.put("lists_3",list);
					break;
				case "연수":
					list = serviceBoard.selectByCno(vo.getCno(), cri);
					map.put("lists_4",list);
					break;
				}
			}
			
			entity = new ResponseEntity<HashMap<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<HashMap<String,Object>>(HttpStatus.OK);
		}
		return entity;
	}
	@RequestMapping(value="/classboardlist",method=RequestMethod.POST)
	public ResponseEntity<List<ClassBoardVO>> postClasslist2(int cno,SearchCriteria cri){
		logger.info("POST classboardlist");
		ResponseEntity<List<ClassBoardVO>> entity = null;
		cri.setPerPageNum(25);
		try{
			List<ClassBoardVO> list = serviceBoard.selectByCno(cno, cri);
			entity = new ResponseEntity<List<ClassBoardVO>>(list,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<ClassBoardVO>>(HttpStatus.OK);
		}
		return entity;
	}
	@RequestMapping(value="/read",method=RequestMethod.GET)
	public ResponseEntity<ClassBoardVO> getRead(int bno){
		logger.info("GET Read");
		ResponseEntity<ClassBoardVO> entity = null;
		try{
			ClassBoardVO vo = serviceBoard.read(bno);
			entity = new ResponseEntity<ClassBoardVO>(vo,HttpStatus.OK);
			return entity;
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<ClassBoardVO>(HttpStatus.OK);
			return entity;
		}
	}
}
