package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClassBoardService;
import com.dgit.util.MediaUtils;

@Controller
@RequestMapping("/classboard/*")
public class ClassBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClassBoardController.class);
	
	@Resource(name = "uploadPath")
	private String outUploadPath;
	
	@Autowired
	private ClassBoardService service;
	
	@RequestMapping(value="classboard")
	public void getClassboard(@RequestParam(value="cno", defaultValue="0") int cno,SearchCriteria cri,Model model){
		logger.info(cno+"" + "page" + cri.getPage());
		List<ClassBoardVO> lists = service.selectByCno(2,cri.getPage()-1);
				
		PageMaker pageMaker = new PageMaker();
		 
		pageMaker.setCri(cri);
		int totalcount = service.count(2);
		pageMaker.setTotalCount(totalcount);
		logger.info(pageMaker.getStartPage()+"");
		logger.info(pageMaker.getEndPage()+"");
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("lists",lists);
		classList(model);
		logger.info("=================classBoard Get====================");
	}
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void getRead(int bno, Model model){
		logger.info("=================read Get====================");
		classList(model);
		ClassBoardVO vo = service.read(bno);
		if(vo.getImgpath() !=null){
			String[] imgArr = vo.getImgpath().split(",");
			model.addAttribute("imgArr",imgArr);
		}
		model.addAttribute("vo",vo);
		
	}
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public void getInsert(Model model){
		classList(model);
		logger.info("=================insert Get====================");
	}
	@RequestMapping(value="/remove")
	public String removeBoard(int bno,int cno){
		logger.info("=================remove Get====================");
		service.remove(bno);
		
		return "redirect:/classboard/classboard?cno="+cno;
	}
	private void classList(Model model){
		List<ClassVO> classList = service.selectByClass();
		model.addAttribute("classList",classList);
	}
	@ResponseBody
	@RequestMapping(value="/upload", method=RequestMethod.POST)	
	public ResponseEntity<List<String>> getUpload(List<MultipartFile> fileList,Model model,String[] name){
		logger.info("=================upload post====================");
		ResponseEntity<List<String>> entity = null;
		File dirPath = new File(outUploadPath);
		for(MultipartFile m : fileList){
			logger.info(m.getOriginalFilename()+"");
		}
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		List<String> nameList = new ArrayList<>();
		for(int i = 0; i<fileList.size();i++){
			UUID uid = UUID.randomUUID();// 중복방지를 위하여 랜덤값 생성
			String fileName = fileList.get(i).getOriginalFilename();
			String type = "."+fileName.substring(fileName.lastIndexOf(".")+1,fileName.length()); 
			String savedName = uid.toString() + "_" + name[i]+type;
			File target = new File(outUploadPath, savedName);
			try {
				FileCopyUtils.copy(fileList.get(i).getBytes(), target);
				nameList.add(outUploadPath+savedName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(nameList.size() !=0){
			entity = new ResponseEntity<List<String>>(nameList,HttpStatus.OK);
		}else{
			entity = new ResponseEntity<List<String>>(HttpStatus.OK);
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST)	
	public ResponseEntity<String> getInsert(List<MultipartFile> fileList,String[] name,ClassBoardVO vo){
		logger.info(vo.toString());
		ResponseEntity<String> entity = null;
		File dirPath = new File(outUploadPath);
		String imgpath = "";
		
		for(MultipartFile m : fileList){
			logger.info(m.getOriginalFilename()+"");
		}
		
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		
		for(int i = 0; i<fileList.size();i++){
			UUID uid = UUID.randomUUID();// 중복방지를 위하여 랜덤값 생성
			String fileName = fileList.get(i).getOriginalFilename();
			String type = "."+fileName.substring(fileName.lastIndexOf(".")+1,fileName.length()); 
			String savedName = uid.toString() + "_" + name[i]+type;
			File target = new File(outUploadPath, savedName);
			try {
				FileCopyUtils.copy(fileList.get(i).getBytes(), target);
				if((i+1) ==fileList.size()){
					imgpath += outUploadPath+savedName;
				}else{
					imgpath += outUploadPath+savedName+",";
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		vo.setImgpath(imgpath);
		service.create(vo);
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		return entity;
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)	
	public void getModify(int bno,Model model){
		logger.info("--get modify---");
		ClassBoardVO vo = service.read(bno);
		if(vo.getImgpath() !=null){
			String[] imgArr = vo.getImgpath().split(",");
			model.addAttribute("imgArr",imgArr);
		}
		model.addAttribute("vo",vo);
		classList(model);
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
}
