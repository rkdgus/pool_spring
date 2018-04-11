package com.dgit.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.TeacherVO;
import com.dgit.service.TeacherService;

@Controller
@RequestMapping("/info")
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	@Autowired
	TeacherService teacherService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String info(String title, Model model) {
		logger.info("=================info Get====================");
		switch (title) {
		case "info":
			title = "시설안내";
			break;
		case "teacher":
			title = "강사소개";
			List<TeacherVO> list=teacherService.select("퇴사");
			List<TeacherVO> list2=new ArrayList<>();
			for(TeacherVO t : list){
				if(t.getInfo()!=null){
					t.setInfo(t.getInfo().replace("\r\n", "<br>"));
				} 
				                
				if(!t.getTitle().equals("사장")){
					list2.add(t);
				}
			
			}
			model.addAttribute("list", list2);
			break;          
		case "road":
			title = "오시는길";
			break;
		default:
			break;
		}
		model.addAttribute("title", title);

		return "info/info";
	}
}
