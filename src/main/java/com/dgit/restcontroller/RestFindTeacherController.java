package com.dgit.restcontroller;

import java.io.UnsupportedEncodingException;
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

import com.dgit.domain.MemberVO;
import com.dgit.domain.TeacherVO;
import com.dgit.service.TeacherService;

@RestController
@RequestMapping("/restFindTeacher/*")
public class RestFindTeacherController {
	private static final Logger logger = LoggerFactory.getLogger(RestFindTeacherController.class);
	
	@Autowired
	TeacherService service;
	
	@RequestMapping(value="/findIdBytell",method=RequestMethod.POST)
	public ResponseEntity<String> findIdByTell(String name,int tno, String tell){
		logger.info("=========find id by tell =========");
		ResponseEntity<String> entity = null;
		try{
			TeacherVO t = service.findIdByTell(name, tell, tno);
			if(t==null){
				entity = new ResponseEntity<String>("fail",HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>(t.getId(),HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/findIdByEmail",method=RequestMethod.POST)
	public ResponseEntity<String> findIdByEmail(String name,int tno,String email){
		logger.info("=========find id by email =========");
		logger.info(name+":"+tno+":"+email);
		ResponseEntity<String> entity = null;
		try{
			TeacherVO t=service.findIdByEmail(name, tno);
			if(t==null){
				entity = new ResponseEntity<String>("fail",HttpStatus.OK);
			}else{
				SendEmail(name,email,t.getId());
				entity = new ResponseEntity<String>("send",HttpStatus.OK);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	private void SendEmail(String name,String email, String id){
		
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			 String d1 = id.substring(0, id.length() - 4);
             String d2 = id.substring(id.length()-4);
             String str="";
             for(int i=0;i<d2.length();i++){
                 str+="*";
             }
			
			// Subject
			String subject = "대구아이티수영장 아이디 발송메일입니다.";                                                
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
					+ "<p style='margin:0; padding:0;color:#666;'>"+name+"님의 아이디를 안내해 드립니다.</p></div>"
					+ "	<div style='background-color:##0166ff;border-top:1px solid #edeae6;border-bottom:1px solid #edeae6;padding:10px 0 5px 0;'>"
					+ "<div style='margin:10px 30px 0 30px;'>"
					+ "<p style='color:#333;'>아래의 아이디로 로그인 하신 후에 타인에게 공개되지 않도록 메일을 삭제하시기 바랍니다.</p>"
					+ "<div style='overflow:hidden;width:290px;margin:20px 0 30px 130px;'>"
					+ "<span style='float:right;width:185px;height:40px;background-color:#dbdbdb;font-size:20px;line-height:40px;text-align:center;font-family:Verdana;'>"+d1+str+"</span></div></div></div>"
					+ "<div style='margin:10px 30px 0 30px;padding:20px 0;text-align:center;'>"
							+ "</div></div>"
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
}
