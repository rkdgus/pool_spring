package com.dgit.restcontroller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.MemberVO;
import com.dgit.domain.TeacherVO;
import com.dgit.service.MemberService;
import com.dgit.service.TeacherService;

@RestController
@RequestMapping("/restInfoUpdate/*")
public class RestInfoUpdateController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestInfoUpdateController.class);
	
	@Autowired
	MemberService mService;
	
	@Autowired
	TeacherService tService;
	
	private String innerUploadPath = "/resources/upload";
	
	@RequestMapping(value="/isleave",method = RequestMethod.POST)
	public ResponseEntity<String> isleave(String pw,String id){
		
		logger.info("================ isleave member post =========");
		ResponseEntity<String> entity = null;
		
		try{
			MemberVO vo = new MemberVO();
			vo.setPw(pw);
			vo.setId(id);
			MemberVO m = mService.selectMember(vo);
			if(m==null){
				entity = new ResponseEntity<String>("fail",HttpStatus.OK);
			}else{
				mService.updateIsleave(id);
				entity = new ResponseEntity<String>("bye",HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/updatePw",method=RequestMethod.POST)
	public ResponseEntity<String> chagePw(String pw,String id,String newPw){
		ResponseEntity<String> entity = null;
		try{
			MemberVO vo = new MemberVO();
			vo.setPw(pw);
			vo.setId(id);
			MemberVO m = mService.selectMember(vo);
			if(m==null){
				entity = new ResponseEntity<String>("fail",HttpStatus.OK);
			}else{
				mService.chagePw(id, newPw);
				entity = new ResponseEntity<String>("success",HttpStatus.OK);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/changeEmail",method=RequestMethod.POST)
	public ResponseEntity<String> chageEmail(String id,String email){
		ResponseEntity<String> entity = null;
		try{
			MemberVO vo = mService.findEmail(email);
			if(vo==null){
				mService.updateEmail(id, email);
				entity = new ResponseEntity<String>("success",HttpStatus.OK);
			}else{
				if(id.equals(vo.getId())){
					entity = new ResponseEntity<String>("success",HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("fail",HttpStatus.OK);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/findTeacher",method=RequestMethod.POST)
	public ResponseEntity<TeacherVO> findTeacherInfo(int tno){
		logger.info("================ find teacher post =========");
		ResponseEntity<TeacherVO> entity = null;
		try{
			TeacherVO vo = tService.selectNo(tno);
			logger.info(vo.toString());
			entity = new ResponseEntity<TeacherVO>(vo,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<TeacherVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/tupdateTell",method=RequestMethod.POST)
	public ResponseEntity<String> updateTell(String tell,int tno){
		ResponseEntity<String> entity = null;
		try{
			tService.updateTell(tno, tell);
			entity = new ResponseEntity<String>("update",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/tupdatePw",method=RequestMethod.POST)
	public ResponseEntity<String> updatePw(String id,String pw,String newPw){
		ResponseEntity<String> entity = null;
		try{
			TeacherVO vo = new TeacherVO();
			vo.setId(id);
			vo.setPw(pw);
			TeacherVO t = tService.selectTeacher(vo);
			if(t==null){
				entity = new ResponseEntity<String>("no",HttpStatus.OK);
			}else{
				vo.setPw(newPw);
				tService.updatePw(vo);
				entity = new ResponseEntity<String>("update",HttpStatus.OK);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/updateInfo",method=RequestMethod.POST)
	public ResponseEntity<String> updateInfo(int tno,String info){
		logger.info("================ update info post =========");
		logger.info(info);
		ResponseEntity<String> entity = null;
		try{
			tService.updateInfo(tno, info);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity  =new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/updateImgpath",method=RequestMethod.POST)
	public ResponseEntity<String> updateImgpath(int tno,String imgpath){
		logger.info("================ update imgpath post =========");
		logger.info(imgpath);
		ResponseEntity<String> entity = null;
		try{
			tService.updateImgpath(tno, imgpath);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity  =new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public ResponseEntity<String> upload(HttpServletRequest request,MultipartFile uploaded_file) throws IOException{
		logger.info("upload ");
		ResponseEntity<String> entity = null;
		String root_path = request.getSession().getServletContext().getRealPath("/");
		File dirPath = new File(root_path+"/"+innerUploadPath+"/teacher");
		String r = request.getContextPath();
		String projectName = r.substring(r.lastIndexOf("/"),r.length());
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		String filePath = projectName +innerUploadPath+"/teacher/";
		
		String savedName = uploaded_file.getOriginalFilename();
		File target = new File(root_path+innerUploadPath+"/teacher", savedName);
		FileCopyUtils.copy(uploaded_file.getBytes(), target);
		
		logger.info(uploaded_file.getOriginalFilename());
		
		return entity;   
	}
	
	
}
