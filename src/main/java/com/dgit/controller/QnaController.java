package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.MemberVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.QnaBoardService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	private String innerUploadPath = "/resources/upload";

	@Autowired
	QnaBoardService service;

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public void qna() {
		logger.info("==========qna get========");
	}
	
	   @ResponseBody
	   @RequestMapping(value="/insert", method=RequestMethod.POST)   
	   public ResponseEntity<String> getUpload(HttpServletRequest request,List<MultipartFile> fileList,QnaBoardVO vo) throws Exception{
	      logger.info("=================upload post====================");
	    logger.info(vo.toString());
	    ResponseEntity<String> entity = null;
	    
	    String root_path = request.getSession().getServletContext().getRealPath("/");
	      File dirPath = new File(root_path+"/"+innerUploadPath+"/qna");
	      if (!dirPath.exists()) {
				dirPath.mkdirs();
			}
	    String imgPath = null;
	    String r = request.getContextPath();
		String projectName = r.substring(r.lastIndexOf("/"),r.length());
		if(fileList.size()>0){
			imgPath = "";
			for(int i = 0; i<fileList.size();i++){
		         
		         String filePath = projectName +innerUploadPath+"/qna/";
		         logger.info(fileList.get(i).getOriginalFilename()+"");
		         try {
		        	 UUID uid = UUID.randomUUID();
		        	String savedName =  uid.toString() + "_" + fileList.get(i).getOriginalFilename();
		        	File target = new File(root_path+innerUploadPath+"/qna", savedName);
		        	FileCopyUtils.copy(fileList.get(i).getBytes(), target);
		        	if((i+1) ==fileList.size()){
		        	   imgPath += filePath+savedName;
		           }else{
		        	   imgPath += filePath+savedName+",";
		           }
		         } catch (IOException e) {
		            e.printStackTrace();
		            entity = new ResponseEntity<String>("fail",HttpStatus.OK);
		            return entity;
		         }
		      }
		}
	      
	      vo.setImgpath(imgPath);
	      service.create(vo);
	      entity = new ResponseEntity<String>("success",HttpStatus.OK);
	      return entity;
	   }
		
		@RequestMapping(value = "/qnaContent",method=RequestMethod.POST)
		public String qnaInsert(QnaBoardVO vo){
			 logger.info("=================qna post====================");
			 service.create(vo);
			return "redirect:/qna/qnaBoard";

		}
		
		@RequestMapping(value="/qnaBoard",method=RequestMethod.GET)
		public void qnaAndAswer(SearchCriteria cri,Model model){
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.countByAll(cri));
			logger.info("======== qnaBoard get ==========");
			List<QnaBoardVO> list = service.selectByAll(cri);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("list", list);
			makePage(model,cri);
		}
		
		@RequestMapping(value="/qnaRead",method=RequestMethod.GET)
		public void readQna(int bno,Model model,SearchCriteria cri){
			logger.info("======== qnaRead get ==========");
			model.addAttribute("cri", cri);
			model.addAttribute("bno", bno);
			makePage(model,cri);
		}
		
		@ResponseBody
		@RequestMapping(value="/checkPw",method=RequestMethod.POST)
		public ResponseEntity<String> checkPw(String pw,int bno){
			logger.info("======== checkPw post ==========");
			ResponseEntity<String> entity = null;
			
			
			QnaBoardVO vo = service.read(bno, pw);
		
			try {
				if (vo == null) {
					entity = new ResponseEntity<String>("fail", HttpStatus.OK);
				} else {
					vo.setPw("");
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}
		
			}catch(Exception e){
				e.printStackTrace();
				entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
				
			}
			return entity;
		}
		
		@RequestMapping(value="/qnaReadSuccess",method=RequestMethod.GET)
		public void pwSuccess(Model model,int bno,SearchCriteria cri){
			
			logger.info("======== pwSuccess get ==========");
			
			QnaBoardVO vo = service.selectByBno(bno);
		
			if(vo.getImgpath() !=null){
				String[] img = vo.getImgpath().split(",");
				model.addAttribute("img",img);
			}
			
			model.addAttribute("qnaBoard", vo);
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
	@RequestMapping(value="/qnaRemove",method=RequestMethod.POST)
	public ResponseEntity<String> qnaRemove(HttpServletRequest request,int bno){
		ResponseEntity<String> entity = null;
		
		
		try{
			QnaBoardVO vo = service.selectByBno(bno);
			if(vo.getImgpath() !=null){
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String[] delImg = vo.getImgpath().split(",");
				for(int i=0; i <delImg.length; i++){
					File file = new File(root_path+delImg[i].replace("/pool", ""));
						file.delete();
				}
			}
			service.remove(bno);
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
}
