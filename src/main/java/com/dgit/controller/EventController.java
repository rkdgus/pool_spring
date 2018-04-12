package com.dgit.controller;

import java.io.File;
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

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.NoticeBoardVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.NoticeBoardService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/event")
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

	@Resource(name = "uploadPath")
	private String outUploadPath;
	
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
	public ResponseEntity<String> getInsert(List<MultipartFile> fileList, NoticeBoardVO vo)
			throws Exception {
		logger.info(vo.toString());
		ResponseEntity<String> entity = null;
		File dirPath = new File(outUploadPath);
		String imgpath = null;

		for (MultipartFile m : fileList) {
			logger.info(m.getOriginalFilename() + "");
		}
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		if(fileList.size()!=0){
			imgpath="";
			
			for (int i = 0; i < fileList.size(); i++) {
				String filePath = outUploadPath + "notice";
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
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int nno) {
		logger.info("=================delete Get====================");
		logger.info("=================delete Get====================");

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
	public ResponseEntity<String> postModify(int nno,List<MultipartFile> fileList,String[] name,NoticeBoardVO vo,String deleteImg) throws Exception{
		logger.info("--post modify---");
		ResponseEntity<String> entity = new ResponseEntity<String>("success",HttpStatus.OK);
		NoticeBoardVO v = service.read(vo.getNno());
		
		String imgPath = "";
		if(v.getImgpath() !=null){
			imgPath = v.getImgpath();
		}
		
		logger.info(imgPath);
		System.gc();
		if(deleteImg !=null){
			String[] delImg = deleteImg.split(",");
			for(int i=0; i <delImg.length; i++){
			File file = new File(delImg[i]);
				file.delete();
				imgPath = imgPath.replace(delImg[i], "");
			}
			imgPath.replaceAll(",,",",");
			if(imgPath.indexOf(",") == 0){
				imgPath = imgPath.replace(",","");
			}
		}
		
		
		logger.info(imgPath);
		if(fileList.size() > 0){
			if(imgPath.length() !=0){
				imgPath += ",";
			}
			for (int i = 0; i < fileList.size(); i++) {
				String filePath = outUploadPath + "notice";
				try {
					String savedName = UploadFileUtils.uploadFile(filePath, fileList.get(i).getOriginalFilename(),
							fileList.get(i).getBytes());
					if ((i + 1) == fileList.size()) {
						imgPath += savedName;
					} else {
						imgPath += savedName + ",";
					}
				} catch (IOException e) {
					e.printStackTrace();
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
