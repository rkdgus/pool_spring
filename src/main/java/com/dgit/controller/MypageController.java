package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.PageMaker;
import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.QnaBoardService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	QnaBoardService service;
	
	@RequestMapping(value="/teacherMypage",method=RequestMethod.GET)
	public void tMypage(){
		logger.info("================teacerh mypage get==============");
	}
	
	
	@RequestMapping(value="/memberMypage",method=RequestMethod.GET)
	public void mMypage(){
		logger.info("================member mypage get==============");
	}
	
	@RequestMapping(value="/attendance",method=RequestMethod.GET)
	public void attendance(){
		logger.info("================member  attendance mypage get==============");
	}
	
	@RequestMapping(value="/myPageQna",method=RequestMethod.GET)
	public void myPageQna(SearchCriteria cri,String id,Model model){
		logger.info("================member mypage  qna get==============");
		List<QnaBoardVO> list = service.selectbyIdQna(id, cri);
		model.addAttribute("list", list);
		model.addAttribute("id", id);
		makePage(model,cri,id);
		
	}
	@RequestMapping(value="/mypageQnaRead",method=RequestMethod.GET)
	public void qnaRead(SearchCriteria cri,String id,Model model,int bno){
		logger.info("================member mypage  qna read get==============");
		QnaBoardVO vo = service.selectByBno(bno);
		model.addAttribute("qna", vo);
		makePage(model,cri,id);
	}
	private void makePage(Model model,SearchCriteria cri,String id){
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalcount = service.selectbyIdCount(id);
		pageMaker.setTotalCount(totalcount);
		model.addAttribute("pageMaker",pageMaker);
	}
	
	
}
