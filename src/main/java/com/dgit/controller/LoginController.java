package com.dgit.controller;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.MemberVO;
import com.dgit.domain.TeacherVO;
import com.dgit.service.MemberService;
import com.dgit.service.TeacherService;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MemberService service;
	@Autowired
	private TeacherService serviceT;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public void getLogin(){
		logger.info("=================login Get====================");
	}
	
	@RequestMapping(value="/auther")
	public void auther(){
		logger.info("=================auther====================");
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public void postLogin(HttpSession session,String id,String pw,String title){
		logger.info("=================login post====================");
		System.out.println(title);
		if(title.equals("회원")){
			MemberVO vo  = new MemberVO();
			vo.setId(id);
			vo.setPw(pw);
			MemberVO m = service.selectMember(vo);
			m.setTitle("회원");
			session.setAttribute("login", m);
			
		}else if(title.equals("관리자")){
			TeacherVO vo = new TeacherVO();
			vo.setId(id);
			vo.setPw(pw);
			TeacherVO t = serviceT.selectTeacher(vo);
			session.setAttribute("login", t);
		}
		
		
	}
	
	@RequestMapping(value="/member",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<MemberVO> postLogin(String id,String pw){
		logger.info("=================member Post====================");
		ResponseEntity<MemberVO> entity = null;
		
		try {
			MemberVO mem = new MemberVO();
			mem.setId(id);
			mem.setPw(pw);
			MemberVO vo  = service.selectMember(mem);
			
			entity = new ResponseEntity<MemberVO>(vo,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/memberId",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<MemberVO> idCheck(String id){
		logger.info("=================id check Post====================");
		ResponseEntity<MemberVO> entity = null;
		
		try {
			MemberVO vo  = service.findMemberId(id);
			if(vo==null){
				MemberVO m = new MemberVO();
				m.setMno(-1);
				entity = new ResponseEntity<MemberVO>(m,HttpStatus.OK);
			}else{
				entity = new ResponseEntity<MemberVO>(vo,HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/teacherId",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<TeacherVO> tIdCheck(String id){
		logger.info("================= teacher id check Post====================");
		ResponseEntity<TeacherVO> entity = null;
		
		try {
			TeacherVO vo  = serviceT.findTeacherId(id);
			if(vo == null){
				TeacherVO t = new TeacherVO();
				t.setTno(-1);
				entity = new ResponseEntity<TeacherVO>(t,HttpStatus.OK);
			}else{
				entity = new ResponseEntity<TeacherVO>(vo,HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<TeacherVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	@RequestMapping(value="/teacher",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<TeacherVO> tlogin(TeacherVO vo){
		logger.info("================= teacher login Post====================");
		ResponseEntity<TeacherVO> entity = null;
		
		try {
			TeacherVO t  = serviceT.selectTeacher(vo);
			entity = new ResponseEntity<TeacherVO>(t,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<TeacherVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	
	}
	
	@RequestMapping(value="/logOut")
	public String logOut(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public void search(){
		logger.info("=================search Get====================");
	}
	
	@RequestMapping(value="/searchId",method=RequestMethod.POST)
	public String searchIdPost(String name,String email,Model model){
		logger.info("=================search POST====================");
		int err = 0;
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setEmail(email);
		vo = service.findMember(vo);
		if(vo ==null){
			err=1;
		}
		model.addAttribute("idvo",vo);
		model.addAttribute("err",err);
		                  
		return "login/result";
	}
	
	@RequestMapping(value="/searchPw",method=RequestMethod.POST)
	public String searchPwPost(String id,String name,String email,Model model){
		logger.info("=================search POST====================");
		MemberVO vo = new MemberVO();
		int err = 0;
		vo.setName(name);
		vo.setEmail(email);
		vo.setId(id);
		vo = service.findPW(vo);                           
		
		if(vo ==null){
			err=1;
		}
		if(vo!=null){
			String newPw =temporaryPassword(10);
			vo.setPw(newPw);
			service.updatePw(vo);                
			SendEmail(vo,newPw);
		}
		model.addAttribute("pwvo",vo);
		model.addAttribute("err",err);
		return "login/result";
	}
	
	
	private void SendEmail(MemberVO vo, String pw){
		
		 String host = "smtp.naver.com";
		String user = "rkd7327";
		String password = "rkdgus0519";
		
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
	
		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail()));

			// Subject
			String subject = "대구아이티수영장 임시비밀번호 발송메일입니다.";                                                
			try {
				message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();                                           
			}                                            
			String PwMeg="<div style='width:700px;background-color:#0166ff;margin:0 auto; padding:0;font:12px/160% Dotum,돋움,serif; color:#101010;overflow:hidden;'>"
					+ "<div style='height:70px;text-align:center;'><h1 style='margin:0px;color:white; padding:25px 0 0 0;'>"
					+ "대구아이티수영장</h1></div>"
					+ "<div style='float:left; width:696px; background:#FFF; min-height:100px; margin:0px; padding:0; padding-bottom:10px; border:2px solid #0166ff'>"
					+ "<div style='margin:30px;line-height:200%'><p style='margin:0; padding:0;color:#666;'>안녕하십니까. 대구아이티수영장입니다. </p>"
					+ "<p style='margin:0; padding:0;color:#666;'>"+vo.getName()+"님의 임시비밀번호를 안내해 드립니다.</p></div>"
					+ "	<div style='background-color:##0166ff;border-top:1px solid #edeae6;border-bottom:1px solid #edeae6;padding:10px 0 5px 0;'>"
					+ "<div style='margin:10px 30px 0 30px;'>"
					+ "<p style='color:#333;'>아래의 임시 비밀번호로 로그인 하신 후에 타인에게 공개되지 않도록 비밀번호를 변경해 주시기 바랍니다.</p>"
					+ "<div style='overflow:hidden;width:290px;margin:20px 0 30px 165px;'>"
					+ "<span style='display:block; width:87px; height:40px; background:url(http://www.shilla.net/images/ko/seoul/email/emailPwd/tmpPwdText.gif); text-indent:-9999%; overflow:hidden;float:left;'>임시비밀번호</span>"
					+ "<span style='float:right;width:185px;height:40px;background-color:#dbdbdb;font-size:20px;line-height:40px;text-align:center;font-family:Verdana;'>"+pw+"</span></div></div></div>"
					+ "<div style='margin:10px 30px 0 30px;padding:20px 0;text-align:center;'>"
							+ "<img style='border:0;' src='http://www.shilla.net/images/ko/seoul/email/emailPwd/loginBtn.gif' alt='로그인 버튼'></div></div>"
							+ "<div style='width:700px;'>"
							+ "<div style='background:#659ef5; float:left; overflow:hidden;padding:20px 40px; width:620px;'><div style='float:left;width:134px;'>"
							+ "</div>"
							+ "<div style='width:700px;margin-top:15px;text-align:center;'><p style='color:white;font-size:11px; '>본 메일은 발신전용 메일입니다. 궁금하신 점은 Contact Us로 문의해주시기 바랍니다.</p></div></div>"
							+ "<div style='float:left; background-color:#0166ff;padding:10px 0;text-align:center;width:100%;'>"
							+ "<p style='font-size:10px;color:#fff;'>Copyright © DGITCOMPANY CO LTD. All Rights Reserved. 대구아이티수영장 : TEL +82-2-2230-5528</p></div></div></div>";
			                                                                        
			// Text/Project_JSP/img/login/login.gif                                          
			message.setText(PwMeg,"UTF-8");
			message.setHeader("content-Type", "text/html");                                   
			
			

			// send the message
			Transport.send(message);
			System.out.println("전송성공");

		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

	//임시비밀번호 랜덤으로 생성
	private String temporaryPassword(int size) {

	StringBuffer buffer = new StringBuffer();

	Random random = new Random();

	String chars[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W"
			,"X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n",
			"o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"};

	for (int i = 0; i < size; i++) {

	buffer.append(chars[random.nextInt(chars.length)]);

	}
	System.out.println(buffer.toString());
	return buffer.toString();
	
	}
	
	
	
	
	
}
