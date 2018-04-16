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

import com.dgit.domain.ClassVO;
import com.dgit.domain.MemberVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.domain.TeacherVO;
import com.dgit.service.ClassService;
import com.dgit.service.MemberService;
import com.dgit.service.QnaBoardService;
import com.dgit.service.RegisterService;
import com.dgit.service.TeacherService;
import com.dgit.util.MediaUtils;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	QnaBoardService service;
	
	@Autowired
	MemberService service2;
	
	@Autowired
	ClassService service3;
	
	@Autowired
	TeacherService service4;
	
	
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
	public void updateMember(int mno,Model model){
		logger.info("================member mypage member info ==============");
		MemberVO vo = service2.selectMemberByMno(mno);
		model.addAttribute("member", vo);
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
		logger.info("============email check=======");
		ResponseEntity<String> entity = null;
		MemberVO  m= service2.findEmail(email);

		try{
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
		logger.info("============update member info=======");
		ResponseEntity<String> entity = null;
		try{
			MemberVO vo = new MemberVO();
			vo.setEmail(email);
			vo.setTell(tell);
			vo.setId(id);
			service2.updateEmailTell(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/updatePwStep1",method=RequestMethod.GET)
	public void updatePwStep1(){
		logger.info("============update Pw step1 get =======");
	}
	
	@RequestMapping(value="/updatePw",method=RequestMethod.GET)
	public void updatePw(){
		logger.info("============update Pw get =======");
	}
	@RequestMapping(value="/updatePw",method=RequestMethod.POST)
	public String updatePwPost(String pw,String id){
		logger.info("============update Pw Post =======");
		service2.chagePw(id, pw);
		return "redirect:/mypage/updatePwStep1";
	}
	
	@RequestMapping(value="/cancelRegisterStep1",method=RequestMethod.GET)
	public void cancelRegisterStep1(){
		logger.info("============ cancelRegisterStep1 get =======");
		
	}
	
	@RequestMapping(value="/cancelRegister",method=RequestMethod.GET)
	public void cancelRegister(){
		logger.info("============ cancelRegister get =======");
	}
	
	@RequestMapping(value="/cancelRegister",method=RequestMethod.POST)
	public ResponseEntity<String> cancel(String id,HttpSession session){
		logger.info("============ cancelRegister Post =======");
		ResponseEntity<String> entity =null;
		try{
			service2.updateIsleave(id);
			session.invalidate();
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/classList",method=RequestMethod.GET)
	public void classList(int mno,Model model,SearchCriteria cri){
		List<ClassVO> list = service3.selectClassBymno(mno, cri);
		model.addAttribute("list", list);
		makePage2(model,cri,mno);
		
	}
	
	private void makePage2(Model model,SearchCriteria cri,int mno){
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalcount = service3.countBymno(mno, cri);
		pageMaker.setTotalCount(totalcount);
		model.addAttribute("pageMaker",pageMaker);
	}
	
	@ResponseBody
	@RequestMapping(value="/teacherInfo",method=RequestMethod.POST)
	public ResponseEntity<TeacherVO> teacherInfo(int tno){
		ResponseEntity<TeacherVO> entity = null;
		try{
			TeacherVO vo = service4.selectNo(tno);
			entity = new ResponseEntity<TeacherVO>(vo,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<TeacherVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
