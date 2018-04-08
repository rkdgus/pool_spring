package com.dgit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.MemberVO;
import com.dgit.service.MemberService;

@Controller
@RequestMapping("/join/*")
public class JoinController {
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	MemberService service;

	@RequestMapping(value = "/joinStep1", method = RequestMethod.GET)
	public void joinStep1() {
		logger.info("=========joinStep1 get==========");
	}

	@RequestMapping(value = "/joinStep2", method = RequestMethod.GET)
	public void joinStep2() {
		logger.info("=========joinStep2 get==========");
	}

	@RequestMapping(value = "/joinStep3", method = RequestMethod.GET)
	public void joinStep3() {
		logger.info("=========joinStep3 get==========");
	}

	@ResponseBody
	@RequestMapping(value = "/checkMno", method = RequestMethod.POST)
	public ResponseEntity<MemberVO> checkMno(String mno) {
		logger.info("=========check MemberShip==========");

		ResponseEntity<MemberVO> entity = null;
		MemberVO m = service.selectMemberByMno(Integer.parseInt(mno));

		try {
			if (m == null) {
				MemberVO m2 = new MemberVO();
				m2.setMno(-1);
				entity = new ResponseEntity<MemberVO>(m2, HttpStatus.OK);
			} else {
				entity = new ResponseEntity<MemberVO>(m, HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/joinStep4", method = RequestMethod.GET)
	public void Step4(String mno, Model model) {
		logger.info("============ join Step4 ==========");
		MemberVO vo = service.selectMemberByMno(Integer.parseInt(mno));
		model.addAttribute("member", vo);

	}

	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public ResponseEntity<String> idCheck(String id,String mno) {
		logger.info("=================id check Post====================");
		ResponseEntity<String> entity = null;

		try {
			MemberVO v = service.selectMemberByMno(Integer.parseInt(mno));
			if(v.getId()!=null){
				entity = new ResponseEntity<String>("already", HttpStatus.OK);
			}else{
				MemberVO vo = service.findMemberId(id);
				if(vo==null){
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("fail", HttpStatus.OK);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	@ResponseBody
	@RequestMapping(value="/updateIdPw",method=RequestMethod.POST)
	public ResponseEntity<String> updateIdPw(String id, String pw, String mno){
		logger.info("=================updateIdPw Post====================");
		ResponseEntity<String> entity = null;
		
		try {
			MemberVO vo = new MemberVO();
			vo.setMno(Integer.parseInt(mno));
			vo.setId(id);
			vo.setPw(pw);
			
			service.updateIdPw(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}

		
		return entity;
	}
	
	@RequestMapping(value="/joinStep5",method=RequestMethod.GET)
	public void joinStep5(String mno,Model model){
		MemberVO vo = service.selectMemberByMno(Integer.parseInt(mno));
		model.addAttribute("member", vo);
		logger.info("=================joinStep5 Get====================");
	}
}
