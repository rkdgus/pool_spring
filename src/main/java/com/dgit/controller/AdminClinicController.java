package com.dgit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.ClinicVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClinicService;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/adminClinic/*")
public class AdminClinicController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private ClinicService service;
	
	@Resource(name = "uploadPath")
	private String outUploadPath;
	
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
	public ResponseEntity<String> postinsert(List<MultipartFile> fileList,ClinicVO vo) throws Exception{
		logger.info("======= insert post ==========");
		ResponseEntity<String> entity = null;
		File dirPath = new File(outUploadPath);
		String imgpath = null;
		
		for(MultipartFile m : fileList){
			logger.info(m.getOriginalFilename()+"");
		}
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		if(fileList.size() !=0){
			imgpath = "";
			for (int i = 0; i < fileList.size(); i++) {
				String filePath = outUploadPath + "classboard/";
				try {
					String savedName = UploadFileUtils.uploadFile(filePath, fileList.get(i).getOriginalFilename(),
							fileList.get(i).getBytes());
					if ((i + 1) == fileList.size()) {
						imgpath += savedName;
					} else {
						imgpath += savedName + ",";
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
	private void makePage(Model model,SearchCriteria cri){
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalcount = service.count(cri);
		pageMaker.setTotalCount(totalcount);
		model.addAttribute("pageMaker",pageMaker);
	}
}
