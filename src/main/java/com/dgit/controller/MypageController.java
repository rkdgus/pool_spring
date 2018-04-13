package com.dgit.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.dgit.domain.MemberVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.MemberService;
import com.dgit.service.QnaBoardService;
import com.dgit.util.MediaUtils;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	QnaBoardService service;
	
	@Autowired
	MemberService service2;
	
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
	@ResponseBody
	@RequestMapping(value="/qnaRemove",method=RequestMethod.POST)
	public ResponseEntity<String> qnaRemove(int bno){
		ResponseEntity<String> entity = null;
		logger.info("================member mypage  qnaRemove post ==============");
		try{
			service.remove(bno);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPw",method=RequestMethod.POST)
	public ResponseEntity<String> checkPw(String id,String pw){
		ResponseEntity<String> entity = null;
		try{
			MemberVO m = service2.selectMember(new MemberVO(pw, id));
			if(m!=null){
				entity  = new ResponseEntity<String>("match",HttpStatus.OK);
			}else{
				entity  = new ResponseEntity<String>("notMatch",HttpStatus.OK);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			entity  = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/memberInfo",method = RequestMethod.GET)
	public void readMember(){
		logger.info("================member mypage member info ==============");
	}
	
	@RequestMapping(value="/updateMember",method=RequestMethod.GET)
	public void updateMember(){
		logger.info("================member mypage member info ==============");
	}
	
	@RequestMapping(value="/updateMemberStep1",method=RequestMethod.GET)
	public void updateStep1(){
		logger.info("================member updateStep1 get ==============");
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
	private void makePage(Model model,SearchCriteria cri,String id){
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalcount = service.selectbyIdCount(id);
		pageMaker.setTotalCount(totalcount);
		model.addAttribute("pageMaker",pageMaker);
	}
	

	@ResponseBody
	@RequestMapping(value="/checkEmail",method=RequestMethod.POST)
	public ResponseEntity<String> checkEmail(String email){
		ResponseEntity<String> entity = null;
		try{
			MemberVO  m= service2.findEmail(email);
			if(m ==null){
				entity = new ResponseEntity<String>("use",HttpStatus.OK);
			}else{
				
				
					entity = new ResponseEntity<String>("not use",HttpStatus.OK);
				
				
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ResponseEntity<String> update(String email,String tell,String id){
		ResponseEntity<String> entity = null;
		try{
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
