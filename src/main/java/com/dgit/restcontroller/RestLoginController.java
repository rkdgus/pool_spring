package com.dgit.restcontroller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.MemberVO;
import com.dgit.domain.TeacherVO;
import com.dgit.service.MemberService;
import com.dgit.service.TeacherService;

@RestController
@RequestMapping("/restLogin/*")
public class RestLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestLoginController.class);
	
	@Autowired
	MemberService mservice;
	
	@Autowired
	TeacherService tservice;
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public ResponseEntity<MemberVO> loginId(String id,String pw,HttpSession session){
		ResponseEntity<MemberVO> entity = null;
		logger.info("=================idCheck post====================");
	
		try {
			MemberVO vo  = mservice.findMemberId(id);
			if(vo==null){
				MemberVO no = new MemberVO();
				no.setMno(-1);
				entity = new ResponseEntity<MemberVO>(no,HttpStatus.OK);
			}else{
				if(vo.isIsleave()==true){
					MemberVO isleave = new MemberVO();
					isleave.setMno(-3);
					entity = new ResponseEntity<MemberVO>(isleave,HttpStatus.OK);
				}else{
					MemberVO m =new MemberVO();
					m.setId(id);
					m.setPw(pw);
					MemberVO find = mservice.selectMember(m);
					if(find == null){
						MemberVO noPw = new MemberVO();
						noPw.setMno(-2);
						entity = new ResponseEntity<MemberVO>(noPw,HttpStatus.OK);
					}else{
						find.setTitle("회원");
						find.setPw("");
						entity = new ResponseEntity<MemberVO>(find,HttpStatus.OK);
						session.setAttribute("androidLogin", find);
					}
				}
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/tLogin",method=RequestMethod.POST)
	public ResponseEntity<TeacherVO> loginTeacher(String id, String pw,HttpSession session){
		ResponseEntity<TeacherVO> entity = null;
		TeacherVO tId =tservice.findTeacherId(id);
		try{
			if(tId==null){
				TeacherVO noId = new TeacherVO();
				noId.setTno(-1);
				entity = new ResponseEntity<TeacherVO>(noId,HttpStatus.OK);
			}else{
				TeacherVO vo = new TeacherVO();
				vo.setId(id);
				vo.setPw(pw);
				TeacherVO t = tservice.selectTeacher(vo);
				if(t ==null){
					TeacherVO noPw = new TeacherVO();
					noPw.setTno(-2);
					entity = new ResponseEntity<TeacherVO>(noPw,HttpStatus.OK);
				}else{
					t.setPw("");
					entity = new ResponseEntity<TeacherVO>(t,HttpStatus.OK);
					session.setAttribute("androidLogin", t);
				}
			}
		
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<TeacherVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
