package com.dgit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.GalleryVO;
import com.dgit.service.GalleryService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Resource(name = "uploadPath")
	private String outUploadPath;

	@Autowired
	GalleryService galleryService;

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

		File dirPath = new File(outUploadPath);
		
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		
		String[] nameArr = name.split(",");
		String[] typeArr =type.split(",");

		ArrayList<String> arrFile = new ArrayList<>();
		
		for (MultipartFile file : fileList) {
			UUID uid = UUID.randomUUID();// 중복방지를 위하여 랜덤값 생성
			String savedName = uid.toString() + "_" + file.getOriginalFilename();
			File target = new File(outUploadPath, savedName);
			try {
				FileCopyUtils.copy(file.getBytes(), target);
				arrFile.add(outUploadPath + savedName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}      
		
		for(int i = 0;i<arrFile.size();i++){
			GalleryVO vo = new GalleryVO();
			vo.setGallery_name(nameArr[i]);
			vo.setGallery_path(arrFile.get(i));
			vo.setGallery_type(typeArr[i]);
			galleryService.insert(vo);
		}
		return "redirect:/admin/gallery";
	}
}
