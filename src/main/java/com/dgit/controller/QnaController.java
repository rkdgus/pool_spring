package com.dgit.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

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

	@Resource(name = "uploadPath")
	private String outUploadPath;

	@Autowired
	QnaBoardService service;

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public void qna() {
		logger.info("==========qna get========");
	}
	
		@ResponseBody
	   @RequestMapping(value="/upload", method=RequestMethod.POST)   
	   public ResponseEntity<String> getUpload(List<MultipartFile> fileList) throws Exception{
	      logger.info("=================upload post====================");
	      ResponseEntity<String> entity = null;
	     
	      String imgPath = "";
	      for(int i = 0; i<fileList.size();i++){
	         
	         String filePath = outUploadPath+"qna";
	         
	         try {
	        	String savedName =  UploadFileUtils.uploadFile(filePath, fileList.get(i).getOriginalFilename(),fileList.get(i).getBytes());
	           if((i+1) ==fileList.size()){
	        	   imgPath += savedName;
	           }else{
	        	   imgPath += savedName+",";
	           }
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      if(!imgPath.equals("")){
	         entity = new ResponseEntity<String>(imgPath,HttpStatus.OK);
	      }else{
	         entity = new ResponseEntity<String>(imgPath,HttpStatus.OK);
	      }
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
			pageMaker.setTotalCount(service.countByAll());
			logger.info("======== qnaBoard get ==========");
			List<QnaBoardVO> list = service.selectByAll((cri.getPage()-1)*15);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("list", list);
		}
		
		@RequestMapping(value="/qnaRead",method=RequestMethod.GET)
		public void readQna(int bno,Model model,int page){
			logger.info("======== qnaRead get ==========");
			model.addAttribute("page", page);
			model.addAttribute("bno", bno);
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
		public void pwSuccess(Model model,int bno,int page){
			
			logger.info("======== pwSuccess get ==========");
			
			QnaBoardVO vo = service.selectByBno(bno);
		
			String path = vo.getImgpath();
			if(!path.equals("null")){
				String[] img = path.split(",");
				model.addAttribute("img",img);
			}
			
			model.addAttribute("qnaBoard", vo);
			model.addAttribute("page", page);
			
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
	public ResponseEntity<String> qnaRemove(String bno){
		ResponseEntity<String> entity = null;
		
		try{
			service.remove(Integer.parseInt(bno));
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
}
