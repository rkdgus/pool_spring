package com.dgit.restcontroller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.Criteria;
import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.QnaBoardService;

@RestController
@RequestMapping("/restQna/*")
public class QnaBoardController {
	
	@Autowired
	QnaBoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(QnaBoardController.class);
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ResponseEntity<String> storeQna(QnaBoardVO vo){
		logger.info("============== qna insert ===========");
		ResponseEntity<String> entity = null;
		try{
			service.create(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ResponseEntity<List<QnaBoardVO>> storeQnaList(String id,SearchCriteria cri){
		logger.info("============== qna insert ===========");
		ResponseEntity<List<QnaBoardVO>> entity = null;
		try{
			List<QnaBoardVO> list=service.selectbyIdQna(id, cri);
			
			entity = new ResponseEntity<List<QnaBoardVO>>(list,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<QnaBoardVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/read",method=RequestMethod.GET)
	public ResponseEntity<QnaBoardVO> readQna(int bno,SearchCriteria cri){
		logger.info("============== qna read ===========");
		ResponseEntity<QnaBoardVO> entity = null;
		try{
			QnaBoardVO vo = service.selectByBno(bno);
			entity = new ResponseEntity<QnaBoardVO>(vo,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<QnaBoardVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
