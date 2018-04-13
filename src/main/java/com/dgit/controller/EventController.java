package com.dgit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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

import com.dgit.domain.NoticeBoardVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.NoticeBoardService;

@Controller
@RequestMapping("/event")
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	private String innerUploadPath = "resources/upload";
	
	@Autowired
	NoticeBoardService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String event(SearchCriteria cri,Model model) {
		logger.info("=================event Get====================");
		List<NoticeBoardVO> lists = service.selectByAll((cri.getPage()-1)*15);

		PageMaker pageMaker = new PageMaker();
		 
		pageMaker.setCri(cri);
		int totalcount = service.count();
		pageMaker.setTotalCount(totalcount);
		logger.info(pageMaker.getStartPage()+"");
		logger.info(pageMaker.getEndPage()+"");
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("lists",lists);
		
		
		
		return "event/event";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		logger.info("=================event Get====================");
		return "event/insert";
	}

	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ResponseEntity<String> getInsert(HttpServletRequest request,List<MultipartFile> fileList, NoticeBoardVO vo)
			throws Exception {
		logger.info(vo.toString());
		String root_path = request.getSession().getServletContext().getRealPath("/");
		ResponseEntity<String> entity = null;
		File dirPath = new File(root_path+"/"+innerUploadPath+"/문의");
		String imgpath = null;
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		if(fileList.size()!=0){ 
			imgpath="";
			String filePath = "/pool/"+innerUploadPath+"/문의/";
			for (int i = 0; i < fileList.size(); i++) {
					UUID uid = UUID.randomUUID();
					String savedName = uid.toString() + "_" + fileList.get(i).getOriginalFilename();
					File target = new File(root_path+"/"+innerUploadPath+"/문의", savedName);
					try {                
						FileCopyUtils.copy(fileList.get(i).getBytes(), target);
						
					} catch (IOException e) {                    
						e.printStackTrace();                                         
					}   
					if ((i + 1) == fileList.size()) {
						imgpath += filePath+savedName;
					} else {
						imgpath += filePath+savedName + ",";
					}
				                   
			}
		}
		vo.setImgpath(imgpath);
		service.create(vo);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(int nno,Model model,SearchCriteria cri,int yes) {
		logger.info("=================read Get====================");
		logger.info("=================read Get====================");
		

		NoticeBoardVO vo = service.read(nno);
		if(yes==1){
			vo.setReadcnt(vo.getReadcnt()+1);
			service.updatecnt(vo);
		}
		
		if(vo.getImgpath() !=null){
			String[] imgArr = vo.getImgpath().split(",");
			model.addAttribute("imgArr",imgArr);
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		/*int totalcount = service.count(cri);
		pageMaker.setTotalCount(totalcount);*/
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("vo",vo);
		
		return "event/read";
	}
	
	
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int nno,HttpServletRequest request) {
		logger.info("=================delete Get====================");
		logger.info("=================delete Get====================");

		NoticeBoardVO vo=service.read(nno);

		String root_path = request.getSession().getServletContext().getRealPath("/");
		String[] delImg = vo.getImgpath().split(",");
		for(int i=0; i <delImg.length; i++){
		File file = new File(delImg[i]);
			file.delete();

		}

		service.remove(nno);
		
		return "redirect:/event/";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void getModify(int nno,Model model,SearchCriteria cri){
		logger.info("--get modify---");
		NoticeBoardVO vo = service.read(nno);
		if(vo.getImgpath() !=null){
			String[] imgArr = vo.getImgpath().split(",");
			model.addAttribute("imgArr",imgArr);
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("vo",vo);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ResponseEntity<String> postModify(HttpServletRequest request,int nno,List<MultipartFile> fileList,String[] name,NoticeBoardVO vo,String deleteImg) throws Exception{
		logger.info("--post modify---");
		ResponseEntity<String> entity = new ResponseEntity<String>("success",HttpStatus.OK);
		NoticeBoardVO v = service.read(vo.getNno());
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String imgPath = "";
		
		if(v.getImgpath() !=null){
			if(deleteImg !=null || fileList.size() >0){
				imgPath = v.getImgpath()+",";
			}else{
				imgPath = v.getImgpath();
			}
		}
	
	
		logger.info(imgPath);
		System.gc();
		if(deleteImg !=null){
			String[] delImg = deleteImg.split(",");
			for(int i=0; i <delImg.length; i++){
			File file = new File(root_path+delImg[i].replace("/pool", ""));
				file.delete();
				imgPath = imgPath.replace(delImg[i], "");
			}
			
			if(imgPath.indexOf(",") == 0){
				
			}
		}
		imgPath = imgPath.replace(",,", "");
		
		logger.info(imgPath);
		if(fileList.size() > 0){
			for (int i = 0; i < fileList.size(); i++) {
				String filePath = "/pool/"+innerUploadPath+"/문의/";
				
					UUID uid = UUID.randomUUID();
					String savedName = uid.toString() + "_" + fileList.get(i).getOriginalFilename();
					File target = new File(root_path+"/"+innerUploadPath+"/문의", savedName);
					try {                
						FileCopyUtils.copy(fileList.get(i).getBytes(), target);
						
					} catch (IOException e) {                    
						e.printStackTrace();                                         
					}   
					if ((i + 1) == fileList.size()) {
						imgPath += filePath+savedName;
					} else {
						imgPath += filePath+savedName + ",";
					}
			}
			
		}
		if(imgPath.length() ==0){
			imgPath = null;
		}
		vo.setImgpath(imgPath);
		logger.info(vo.toString());
		service.modify(vo);
		return entity;
	}

}
