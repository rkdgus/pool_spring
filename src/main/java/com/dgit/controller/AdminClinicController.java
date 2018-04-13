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
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClinicVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClinicService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/adminClinic/*")
public class AdminClinicController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	private String innerUploadPath = "/resources/upload";
	@Autowired
	private ClinicService service;
	
	@RequestMapping(value="/adminClinic",method=RequestMethod.GET)
	public void adminQna(SearchCriteria cri,Model model){
		logger.info("======= adminClinic get ==========");
		List<ClinicVO> lists = service.list(cri);
		makePage(model,cri);
		model.addAttribute("lists",lists);
	}
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public void getinsert(SearchCriteria cri,Model model){
		logger.info("======= insert get ==========");
	}
	@ResponseBody
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ResponseEntity<String> postinsert(HttpServletRequest request,List<MultipartFile> fileList,ClinicVO vo) throws Exception{
		logger.info("======= insert post ==========");
		ResponseEntity<String> entity = null;
		String root_path = request.getSession().getServletContext().getRealPath("/");
		File dirPath = new File(root_path+"/"+innerUploadPath+"/clinic");
		String imgpath = null;
		
		String r = request.getContextPath();
		String projectName = r.substring(r.lastIndexOf("/"),r.length());
		
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		if(fileList.size() !=0){
			imgpath = "";
			String filePath = projectName +innerUploadPath+"/clinic/";
			for (int i = 0; i < fileList.size(); i++) {
				UUID uid = UUID.randomUUID();
				String savedName = uid.toString() + "_" + fileList.get(i).getOriginalFilename();
				File target = new File(root_path+innerUploadPath+"/clinic", savedName);
				try {
					FileCopyUtils.copy(fileList.get(i).getBytes(), target);
					if ((i + 1) == fileList.size()) {
						imgpath += filePath+savedName;
					} else {
						imgpath += filePath+savedName + ",";
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		vo.setClinic_path(imgpath);
		service.create(vo);
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		return entity;
		
	}
	@RequestMapping(value="/read",method=RequestMethod.GET)
	public void read(int no, Model model,SearchCriteria cri){
		logger.info("======= insert post ==========");
		makePage(model,cri);
		ClinicVO vo = service.read(no);
		if(vo.getClinic_path() !=null){
			String[] imgArr = vo.getClinic_path().split(",");
			model.addAttribute("imgArr",imgArr);
		}
		model.addAttribute("vo",vo);
	}
	@RequestMapping(value="/remove",method=RequestMethod.GET)
	public String remove(int no){
		logger.info("======= remove ==========");
		service.remove(no);
		return "redirect:adminClinic";
	}
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void getmodify(int no,Model model,SearchCriteria cri){
		logger.info("======= modify GET==========");
		ClinicVO vo = service.read(no);
		makePage(model,cri);
		model.addAttribute("vo",vo);
	}
	@ResponseBody
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ResponseEntity<String> postModify(HttpServletRequest request,List<MultipartFile> fileList,ClinicVO vo,String deleteImg) throws Exception{
		logger.info("--post modify---");
		ResponseEntity<String> entity = new ResponseEntity<String>("success",HttpStatus.OK);
		String root_path = request.getSession().getServletContext().getRealPath("/");
		File dirPath = new File(root_path+innerUploadPath+"/clinic");
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		String r = request.getContextPath();
		String projectName = r.substring(r.lastIndexOf("/"),r.length());
		ClinicVO v = service.read(vo.getClinic_no());
		
		String imgPath = "";
		if(v.getClinic_path() !=null){
			if(deleteImg !=null || fileList.size() >0){
				imgPath = v.getClinic_path()+",";
			}else{
				imgPath = v.getClinic_path();
			}
			
		}
		System.gc();
		if(deleteImg !=null){
			String[] delImg = deleteImg.split(",");
			for(int i=0; i <delImg.length; i++){
			File file = new File(root_path+delImg[i].replace("/pool", ""));
				file.delete();
				imgPath = imgPath.replace(delImg[i]+",", "");
			}
		}
		imgPath = imgPath.replace(",,", ",");
		if(fileList.size() > 0){
			String filePath = projectName +innerUploadPath+"/clinic/";
			for (int i = 0; i < fileList.size(); i++) {
				UUID uid = UUID.randomUUID();
				String savedName = uid.toString() + "_" + fileList.get(i).getOriginalFilename();
				File target = new File(root_path+innerUploadPath+"/clinic", savedName);
				try {
					FileCopyUtils.copy(fileList.get(i).getBytes(), target);
					if ((i + 1) == fileList.size()) {
						imgPath += filePath+savedName;
					} else {
						imgPath += filePath+savedName + ",";
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		if(imgPath.length() ==0){
			imgPath = null;
		}
		logger.info("db셋팅"+imgPath);
		vo.setClinic_path(imgPath);
		service.modify(vo);
		return entity;
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
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	private void makePage(Model model,SearchCriteria cri){
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalcount = service.count(cri);
		pageMaker.setTotalCount(totalcount);
		model.addAttribute("pageMaker",pageMaker);
	}
}
