package com.dgit.controller;

import java.io.FileInputStream;
import java.io.InputStream;
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
			logger.info("================1"+vo.toString());
			service.answerUpdate(vo);
			SendEmail(Integer.parseInt(bno),answer);
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
	
	private void SendEmail(int bno,String answer){
		
		 String host = "smtp.naver.com";
		String user = "rkd7327";
		String password = "rkdgus0519";
		
		QnaBoardVO vo = service.selectByBno(bno);
		
		if(!vo.getId().equals("")){
			return;
		}
		
		
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
			String subject = "대구아이티수영장 문의내역 발송메일입니다.";                                                
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
					+ "<p style='margin:0; padding:0;color:#666;'>"+vo.getWriter()+"님의 문의내역 답변을 안내해 드립니다.</p></div>"
					+ "	<div style='background-color:##0166ff;border-top:1px solid #edeae6;border-bottom:1px solid #edeae6;padding:10px 0 5px 0;'>"
					+ "<div style='margin:10px 30px 0 30px;'>"
					+ "<p style='color:#333;'>대구아이티 수영장을 이용해 주셔셔 감사합니다</p>"
					+ "<div style='overflow:hidden;width:100%;'>"
					+ "<span style='width:98%;display:block;height:40px;border:1px solid #dbdbdb;font-size:13px;line-height:40px;text-align:inherit;font-family:Verdana;margin-top:10px;padding:5px;'>"+answer+"</span></div></div></div>"
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
