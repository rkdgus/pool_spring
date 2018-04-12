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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.ClassreplyVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClassBoardService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

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
		List<ClassBoardVO> lists = service.selectByCno(cno,cri);

		makePage(model,cri,cno);
		model.addAttribute("cno",cno);
		model.addAttribute("lists",lists);
		logger.info("=================classBoard Get====================");
	}
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void getRead(SearchCriteria cri,int bno, Model model,String rnt){
		logger.info("=================read Get====================");
		ClassBoardVO vo = service.read(bno);
		List<ClassreplyVO> replyList = service.replySelectByBno(bno);
		if(vo.getImgpath() !=null){
			String[] imgArr = vo.getImgpath().split(",");
			model.addAttribute("imgArr",imgArr);
		}
		if(rnt !=null){
			ClassBoardVO vo2 = new ClassBoardVO();
			vo2.setReadcnt(vo.getReadcnt()+1);
			vo2.setBno(vo.getBno());
			service.readCnt(vo2);
			vo.setReadcnt(vo2.getReadcnt());
		}
		makePage(model,cri,vo.getCno());
		model.addAttribute("replyList",replyList);
		model.addAttribute("vo",vo);
		
	}
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public void getInsert(int cno,Model model){
		classList(model);
		model.addAttribute("cno",cno);
		logger.info("=================insert Get====================");
	}
	@RequestMapping(value="/remove")
	public String removeBoard(int bno,int cno){
		logger.info("=================remove Get====================");
		service.remove(bno);
		
		return "redirect:/classboard/classboard?cno="+cno;
	}
	@ResponseBody
	@RequestMapping(value="/sidebar", method=RequestMethod.POST)	
	private ResponseEntity<List<ClassVO>> classList(){
		ResponseEntity<List<ClassVO>> entity= null;
		List<ClassVO> classList = service.selectByClass();
		entity = new ResponseEntity<List<ClassVO>>(classList,HttpStatus.OK);
		return entity;
		
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
	public ResponseEntity<String> getInsert(List<MultipartFile> fileList,String[] name,ClassBoardVO vo) throws Exception{
		logger.info(vo.toString());
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
				String filePath = outUploadPath + "classboard/"+vo.getCno()+"반";
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
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void getModify(int cno,SearchCriteria cri,int bno,Model model){
		logger.info("--get modify---");
		classList(model);
		ClassBoardVO vo = service.read(bno);
		if(vo.getImgpath() !=null){
			String[] imgArr = vo.getImgpath().split(",");
			model.addAttribute("imgArr",imgArr);
		}
		model.addAttribute("vo",vo);
		makePage(model,cri,cno);
		model.addAttribute("cno",cno);

	}
	@ResponseBody
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ResponseEntity<String> postModify(int bno,List<MultipartFile> fileList,String[] name,ClassBoardVO vo,String deleteImg) throws Exception{
		logger.info("--post modify---");
		ResponseEntity<String> entity = new ResponseEntity<String>("success",HttpStatus.OK);
		ClassBoardVO v = service.read(vo.getBno());
		
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
				String filePath = outUploadPath + "classboard/"+vo.getCno()+"반";
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
	@RequestMapping(value = "insertReply", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<List<ClassreplyVO>> insertReply(ClassreplyVO vo){
		logger.info("insertReply");
		ResponseEntity<List<ClassreplyVO>> entity = null;
		logger.info(vo.toString());
		try{
			service.createReply(vo);
			List<ClassreplyVO> replyList = service.replySelectByBno(vo.getBno());
			entity = new ResponseEntity<>(replyList,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.OK);
		}
		return entity;
	}
	@RequestMapping(value = "deleteReply", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<ClassreplyVO>> deleteReply(ClassreplyVO vo){
		logger.info("deleteReply");
		ResponseEntity<List<ClassreplyVO>> entity = null;
		logger.info(vo.toString());
		try{
			service.removeReply(vo.getRno());
			List<ClassreplyVO> replyList = service.replySelectByBno(vo.getBno());
			entity = new ResponseEntity<>(replyList,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.OK);
		}
		return entity;
	}
	@RequestMapping(value = "updateReply", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<List<ClassreplyVO>> updateReply(ClassreplyVO vo){
		logger.info("updateReply");
		ResponseEntity<List<ClassreplyVO>> entity = null;
		logger.info(vo.toString());
		try{
			service.modifyReply(vo);
			List<ClassreplyVO> replyList = service.replySelectByBno(vo.getBno());
			entity = new ResponseEntity<>(replyList,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.OK);
		}
		return entity;
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(SearchCriteria cri,int bno){
		logger.info("loginHandler");
		return "redirect:/classboard/read?bno="+bno+"&page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword();
	}
	private void makePage(Model model,SearchCriteria cri, int cno){
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalcount = service.count(cno,cri);
		pageMaker.setTotalCount(totalcount);
		model.addAttribute("pageMaker",pageMaker);
	}
	 private void classList(Model model){
	      List<ClassVO> classList = service.selectByClass();
	      model.addAttribute("classList",classList);
	 }
}
