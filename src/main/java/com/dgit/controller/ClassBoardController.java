package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClassBoardService;

@Controller
@RequestMapping("/classboard/*")
public class ClassBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClassBoardController.class);
	@Autowired
	private ClassBoardService service;
	
	@RequestMapping(value="classboard")
	public void getClassboard(@RequestParam(value="cno", defaultValue="0") int cno,SearchCriteria cri,Model model){
		logger.info(cno+"" + "page" + cri.getPage());
		List<ClassBoardVO> lists = service.selectByCno(2,cri.getPage()-1);
				
		PageMaker pageMaker = new PageMaker();
		 
		pageMaker.setCri(cri);
		int totalcount = service.count(2);
		pageMaker.setTotalCount(totalcount);
		logger.info(pageMaker.getStartPage()+"");
		logger.info(pageMaker.getEndPage()+"");
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("lists",lists);
		classList(model);
		logger.info("=================classBoard Get====================");
	}
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void getRead(int bno, Model model){
		logger.info("=================read Get====================");
		classList(model);
		ClassBoardVO vo = service.read(bno);
		model.addAttribute("vo",vo);
		
	}
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public void getInsert(Model model){
		classList(model);
		logger.info("=================insert Get====================");
	}
	@RequestMapping(value="/remove")
	public String removeBoard(int bno,int cno){
		logger.info("=================remove Get====================");
		service.remove(bno);
		
		return "redirect:/classboard/classboard?cno="+cno;
	}
	private void classList(Model model){
		List<ClassVO> classList = service.selectByClass();
		model.addAttribute("classList",classList);
	}
}
