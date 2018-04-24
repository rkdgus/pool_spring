package com.dgit.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.AttendanceVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.MemberVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.RegisterVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.domain.TeacherVO;
import com.dgit.service.AttendanceService;
import com.dgit.service.ClassService;
import com.dgit.service.MemberService;
import com.dgit.service.RegisterService;
import com.dgit.service.TeacherService;

@Controller
@RequestMapping(value="/teacherpage/*")
public class TeacherpageController {
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherpageController.class);
	private String innerUploadPath = "resources/upload";
	@Autowired
	TeacherService service;
	
	@Autowired
	ClassService service2;
	
	@Autowired
	MemberService service3;
	
	@Autowired
	RegisterService service4;
	
	@Autowired
	AttendanceService service5;
	
	@RequestMapping(value="/teacherMypage",method=RequestMethod.GET)
	public void teacherpage(){
		logger.info("============== teacher mypage get ========");
	}
	
	@RequestMapping(value="/teacherInfo",method=RequestMethod.GET)
	public void teacherInfo(int tno,Model model){
		logger.info("============== teacher mypage teacherInfo get ========");
		TeacherVO vo = service.selectNo(tno);
		model.addAttribute("teacher", vo);
	}
	
	@RequestMapping(value="/updateteacherStep1",method=RequestMethod.GET)
	public void updateteacherStep1(){
		logger.info("============== teacher mypage updateteacherStep1 get ========");
	}
	
	@RequestMapping(value="/updateTeacher",method=RequestMethod.GET)
	public void updateTeacher(int tno,Model model){
		TeacherVO vo = service.selectNo(tno);
		model.addAttribute("teacher", vo);
		logger.info("============== teacher mypage updateteacher get ========");
	}
	
	@RequestMapping(value="/updatePwStep1",method=RequestMethod.GET)
	public void updatePwStep1(){
		logger.info("============== teacher mypage updatePwStep1 get ========");
	}
	
	@RequestMapping(value="/updatePw",method=RequestMethod.GET)
	public void updatePwget(){
		logger.info("============== teacher mypage updatePw get ========");
	}
	
	@RequestMapping(value="/updatePw",method=RequestMethod.POST)
	public String updatePw(String id, String pw){
		logger.info("============== teacher mypage updatePw post ========");
		TeacherVO vo = new TeacherVO();
		vo.setId(id);
		vo.setPw(pw);
		service.updatePw(vo);
		return "redirect:/teacherpage/updatePwStep1";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPw",method=RequestMethod.POST)
	public ResponseEntity<String> checkPw(String id,String pw){
		ResponseEntity<String> entity = null;
		
		try{
			TeacherVO vo = new TeacherVO();
			vo.setId(id);
			vo.setPw(pw);
			TeacherVO t = service.selectTeacher(vo);
			if(t!=null){
				entity  = new ResponseEntity<String>("match",HttpStatus.OK);
			}else{
				entity  = new ResponseEntity<String>("notMatch",HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/teacherClass",method=RequestMethod.GET)
	public void teacherClass(SearchCriteria cri,int tno,Model model){
		logger.info("============== teacher mypage class Info get ========");
		List<ClassVO> list = service2.selectAllClass(tno, cri);
		model.addAttribute("list", list);
		makePage(model,cri,tno);
	}
	
	private void makePage(Model model,SearchCriteria cri,int tno){
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalcount = service2.countBytno(tno, cri);
		pageMaker.setTotalCount(totalcount);
		model.addAttribute("pageMaker",pageMaker);
	}
	
	@ResponseBody
	@RequestMapping(value="/registerStudent",method=RequestMethod.POST)
	public ResponseEntity<List<MemberVO>> registerMember(int cno){
		logger.info("============== registerMember post ========");
		ResponseEntity<List<MemberVO>> entity = null;
		try{
			List<MemberVO> list = service3.selectRegisterMember(cno);
			entity = new ResponseEntity<List<MemberVO>>(list,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<MemberVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="/updateTeacher",method=RequestMethod.POST)
	public String updateTeacherInfo(TeacherVO vo, MultipartFile fileList, HttpServletRequest request){
		logger.info("=================teacherUpdate POST====================");
		
		String root_path = request.getSession().getServletContext().getRealPath("/");
		if(fileList.getSize()!=0){
			
			File dirPath = new File(root_path+"/"+innerUploadPath+"/강사사진");
		                                                                         
			if (!dirPath.exists()) {
				dirPath.mkdirs();
			}
			vo=service.selectNo(vo.getTno());    
			System.out.println(vo.toString()); 
			if(vo.getImg_path() !=null){
				System.gc();
				File file = new File(root_path+vo.getImg_path().replace("/pool", ""));
				file.delete();
			}
			UUID uid = UUID.randomUUID();// 중복방지를 위하여 랜덤값 생성
			String savedName = uid.toString() + "_" + fileList.getOriginalFilename();
			File target = new File(root_path+"/"+innerUploadPath+"/강사사진", savedName);
			try {                
				FileCopyUtils.copy(fileList.getBytes(), target);
				savedName="/pool/"+innerUploadPath+"/강사사진/"+savedName;
			} catch (IOException e) {
				e.printStackTrace();                                         
			}       
		                    
			vo.setImg_path(savedName);
			
		}else{
			int no = vo.getTno();
			TeacherVO vo1 = service.selectNo(no);
			
			vo.setImg_path(vo1.getImg_path());
		
		}
		
		logger.info(vo.toString());
		service.update(vo);
		
		return "redirect:/teacherpage/updateteacherStep1";
		
	}
	@RequestMapping(value="/attendance",method=RequestMethod.GET)
	public void attend(int tno, Model model,SearchCriteria cri){
		logger.info("============== attend post ========");
		Date date = new Date();
		date.setDate(1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String s_day = sdf.format(date);
		List<ClassVO> lists = service2.selectClassTno(tno,"to", s_day, cri);
		model.addAttribute("lists",lists);
		makePage(model, cri, tno);
	}
	@ResponseBody
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ResponseEntity<List<ClassVO>> list(String search,int tno, Model model,SearchCriteria cri){
		logger.info("============== attend post ========");
		
		ResponseEntity<List<ClassVO>> entity = null;
		Date date = new Date();
		date.setDate(1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String s_day = sdf.format(date);
		List<ClassVO> lists = service2.selectClassTno(tno,search, s_day, cri);
		model.addAttribute("lists",lists);
		
		makePage(model, cri, tno);
		entity = new ResponseEntity<List<ClassVO>>(lists,HttpStatus.OK);
		return entity;
	}
	@ResponseBody
	@RequestMapping(value="/read",method=RequestMethod.GET)
	public ResponseEntity<HashMap<String,Object>> attendread(String cno, Model model,SearchCriteria cri){
		logger.info("============== read post ========");
		ResponseEntity<HashMap<String, Object>> entity = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ClassVO cls = service2.selectAll(Integer.parseInt(cno));
		String month = sdf.format(cls.getS_day());
		logger.info(month);
		int monthLast = Integer.parseInt(month.substring(5, 7));
		List<Integer> days = monthOfLasyDay(monthLast);
		List<RegisterVO> list = service4.selectByCno(Integer.parseInt(cno));
		logger.info(monthLast+"");
		HashMap<String,Object> map = new HashMap<>();
		map.put("days",days);
		int index = 1;
		for(RegisterVO vo : list){
			
			List<Object> lists = new ArrayList<>();
			MemberVO member = service3.selectMemberByMno(vo.getMno());
			lists.add(member.getName());
			for(int i=0; i<days.size(); i++){
				Date date = new Date();
				date.setMonth(monthLast-1);
				date.setDate(days.get(i));
				String s_day = sdf.format(date);
				AttendanceVO vo2 = service5.selectByMno(vo.getMno(),s_day).get(0);
				lists.add(vo2);
				
			}
			String name = "list"+ index+"";
			map.put(name,lists);
			index++;
		}
		entity = new ResponseEntity<>(map,HttpStatus.OK);
		return entity;
	}
	
	private List<Integer> monthOfLasyDay(int month) {
		
		Calendar cal = Calendar.getInstance();
		Date d = new Date();
		d.setMonth(month-1);
		cal.setTime(d);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		List<Integer> lists = new ArrayList<>();
		for(int i=1; i <= lastDay; i++) {
			d.setDate(i);
			if(d.getDay() != 0 && d.getDay() !=6) {
				lists.add(i);
			}
		}
		return lists;
	}
}
