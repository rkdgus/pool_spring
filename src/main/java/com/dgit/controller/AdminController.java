package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.ClassVO;
import com.dgit.domain.GalleryVO;
import com.dgit.domain.MemberVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.RegisterVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.domain.TeacherVO;
import com.dgit.service.ClassService;
import com.dgit.service.GalleryService;
import com.dgit.service.MemberService;
import com.dgit.service.RegisterService;
import com.dgit.service.TeacherService;
import com.dgit.util.MediaUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Resource(name = "uploadPath")
	private String outUploadPath;

	@Autowired
	GalleryService galleryService;
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	MemberService memberService;
	@Autowired
	RegisterService registerService;
	@Autowired
	ClassService classService;

	
	

	//갤러리
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String admin() {
		logger.info("=================admin Get====================");
		return "admin/admin";
	}

	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String gallery(Model model) {
		logger.info("=================gallery Get====================");
		List<GalleryVO> list = galleryService.selectAll();
		model.addAttribute("list", list);
		
		return "admin/gallery_admin";
	}

	@RequestMapping(value = "/gallery", method = RequestMethod.POST)
	public String galleryPost(List<MultipartFile> fileList, HttpServletRequest request,Model model,String name,String type) {
		logger.info("=================gallery post====================");

		File dirPath = new File(outUploadPath+"갤러리");
		
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		
		String[] nameArr = name.split(",");
		String[] typeArr =type.split(",");

		String typeName="";

		ArrayList<String> arrFile = new ArrayList<>();
		
		for (MultipartFile file : fileList) {
			UUID uid = UUID.randomUUID();// 중복방지를 위하여 랜덤값 생성
			String savedName = uid.toString() + "_" + file.getOriginalFilename();
			File target = new File(outUploadPath+"갤러리", savedName);
			try {                
				FileCopyUtils.copy(file.getBytes(), target);
				arrFile.add(outUploadPath+"갤러리/"+savedName);
			} catch (IOException e) {
				e.printStackTrace();                                         
			}       
		}                    
		
		for(int i = 0;i<arrFile.size();i++){
			GalleryVO vo = new GalleryVO();
			vo.setGallery_name(nameArr[i]);
			vo.setGallery_path(arrFile.get(i));
			if(typeArr[i].equals("0")){
				typeName="내부사진";
			}else if(typeArr[i].equals("1")){
				typeName="외부사진";
			}else if(typeArr[i].equals("2")){
				typeName="강습사진";
			}else if(typeArr[i].equals("3")){
				typeName="인접시설물";
			}
			vo.setGallery_type(typeName);
			galleryService.insert(vo);
		}
		return "redirect:/admin/gallery";
	}

	
	@RequestMapping(value = "displayFile", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<byte[]> displayFile(String filename) {
		ResponseEntity<byte[]> entity = null;
		logger.info("displayFile : " + filename);
		InputStream in = null;
		try {
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);
			MediaType type = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(type);
             
			in = new FileInputStream(filename);                

			entity = new ResponseEntity<>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			// TODO: handle exception               
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/gallery/delete/{no}", method = RequestMethod.GET)
	public String galleryDelete(@PathVariable("no")int[] no) {
		logger.info("=================galleryDelete Get====================");
		logger.info("=================galleryDelete Get====================");
                                            
		for(int i=0;i<no.length;i++){
			System.gc();
			GalleryVO vo = galleryService.selectNum(no[i]);
			System.out.println(vo.toString());
			File file = new File(vo.getGallery_path());
			file.delete();
			galleryService.delete(no[i]);
		}  
		return "redirect:/admin/gallery";
	}
	
	//강사관리
	@RequestMapping(value = "/teacher", method = RequestMethod.GET)
	public String teacher(Model model) {
		logger.info("=================teacher Get====================");
		List<TeacherVO> list = teacherService.selectAll();
		model.addAttribute("list", list);
		
		return "admin/teacher_admin";
	}
	
	@RequestMapping(value = "/teacher/read", method = RequestMethod.GET)
	public String teacherRead(Model model,int no) {
		logger.info("=================teacherRead Get====================");
		TeacherVO vo= teacherService.selectNo(no);
		model.addAttribute("vo", vo);
		
		return "admin/teacher_read_admin";         
	}
	
	@RequestMapping(value = "/teacher/read", method = RequestMethod.POST)
	public String teacherUpdate(Model model,TeacherVO vo,MultipartFile fileList, HttpServletRequest request) {
		logger.info("=================teacherUpdate POST====================");
		
		
		if(fileList.getSize()!=0){

		File dirPath = new File(outUploadPath);
		                                                                         
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		

			UUID uid = UUID.randomUUID();// 중복방지를 위하여 랜덤값 생성
			String savedName = uid.toString() + "_" + fileList.getOriginalFilename();
			File target = new File(outUploadPath, savedName);
			try {                
				FileCopyUtils.copy(fileList.getBytes(), target);
				savedName=outUploadPath+savedName;
			} catch (IOException e) {
				e.printStackTrace();                                         
			}       
		                    
			vo.setImg_path(savedName);
		}else{
			int no = vo.getTno();
			TeacherVO vo1 = teacherService.selectNo(no);
			
			vo.setImg_path(vo1.getImg_path());
			
		}
	
		teacherService.update(vo);
		
		return "redirect:/admin/teacher";
	}  
	
	
	@RequestMapping(value="/member", method=RequestMethod.GET )
	public String memberGet(SearchCriteria cri,Model model){
		
		List<MemberVO> lists = memberService.selectMemberPage((cri.getPage()-1)*15);
		
		PageMaker pageMaker = new PageMaker();
		 
		pageMaker.setCri(cri);
		int totalcount = memberService.countByAll();
		pageMaker.setTotalCount(totalcount);
		logger.info(pageMaker.getStartPage()+"");
		logger.info(pageMaker.getEndPage()+"");
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("lists",lists);
		
		
		return "admin/member";
	}
	      
	
	@RequestMapping(value = "/member/read", method = RequestMethod.GET)
	public String memberRead(Model model,int mno) {
		logger.info("=================memberRead Get====================");
		MemberVO vo = memberService.selectMemberByMno(mno);
		List<RegisterVO> list=registerService.selectAll(mno);
		List<String> classes = new ArrayList<>();
		for(RegisterVO r : list){
			
			ClassVO c=classService.selectAll(r.getCno());
			classes.add(c.getS_day()+")"+c.getTime()+"시"+c.getLevel()+"반");
		}
		model.addAttribute("vo", vo);
		model.addAttribute("classes", classes);

		
		return "admin/read_member";
	}
	

}
