package com.dgit.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import com.dgit.util.MediaUtils;

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
		pageMaker.setTotalCount(service.countByAll(cri));
		List<QnaBoardVO> list = service.selectByAll(cri);
		
		model.addAttribute("qna", list);
		model.addAttribute("pageMaker", pageMaker);
		makePage(model,cri);
	}
	@RequestMapping(value="/qnaRead",method=RequestMethod.GET)
	public void adminQnaRead(int bno,SearchCriteria cri,Model model){
		logger.info("======= admin qna read get ==========");
		QnaBoardVO vo = service.selectByBno(bno);
		logger.info(vo.toString());
		model.addAttribute("qna",vo);
		model.addAttribute("cri", cri);
		makePage(model,cri);
	}
	
	@RequestMapping(value="displayFile",method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String filename){
		//filename에 년월일이 다 붙은 이름이 돌아온다
		ResponseEntity<byte[]> entity = null;

		logger.info("[filename]:"+filename);
		InputStream in =null;
		
		try {
			//jpg,png인지를 구분
			String formatName = filename.substring(filename.lastIndexOf(".")+1);
			MediaType type = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(type);
			
			in = new FileInputStream(filename);
			
			
			entity = new ResponseEntity<>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/qnaAnswer",method=RequestMethod.POST)
	public ResponseEntity<String> insertAnswer(String answer,String bno){
		logger.info("======= admin qna answer post ==========");
		ResponseEntity<String> entity = null;
		
		try{
			QnaBoardVO vo  =new QnaBoardVO();
			vo.setAnswer(answer);
			vo.setBno(Integer.parseInt(bno));
			service.answerUpdate(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	private void makePage(Model model,SearchCriteria cri){
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalcount = service.countByAll(cri);
		pageMaker.setTotalCount(totalcount);
		model.addAttribute("pageMaker",pageMaker);
	}
	
	@ResponseBody
	@RequestMapping(value="/qnaRemove")
	public ResponseEntity<String> removeQna(int bno,SearchCriteria cri){
		ResponseEntity<String> entity = null;
		try{

			service.remove(bno);
			
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
