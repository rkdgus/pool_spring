package com.dgit.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.AttendanceVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.MemberVO;
import com.dgit.service.AttendanceService;
import com.dgit.service.MemberService;
import com.dgit.service.RegisterService;

@RestController
@RequestMapping("/restregister/*")
public class RestRegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RestRegisterController.class);
	@Autowired
	private RegisterService service;

	@Autowired
	private MemberService mservice;

	@Autowired
	private AttendanceService aservice;

	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public ResponseEntity<List<MemberVO>> getClasslist(int cno) {
		logger.info("GET memberList");
		ResponseEntity<List<MemberVO>> entity = null;

		try {
			List<MemberVO> lists = mservice.selectRegisterMember(cno);

			entity = new ResponseEntity<List<MemberVO>>(lists, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MemberVO>>(HttpStatus.OK);
		}

		return entity;
	}

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public ResponseEntity<MemberVO> getMember(int mno) {
		logger.info("GET member");
		ResponseEntity<MemberVO> entity = null;

		try {
			MemberVO vo = mservice.selectMemberByMno(mno);

			entity = new ResponseEntity<MemberVO>(vo, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.OK);
		}

		return entity;
	}

	@RequestMapping(value = "/attendance", method = RequestMethod.GET)
	public ResponseEntity<List<String>> getAttendance(int mno, String lists) {
		logger.info("GET member");
		ResponseEntity<List<String>> entity = null;

		try {
			List<String> list2 = new ArrayList<>();
			String[] arr = lists.split("/");
			for (int i = 0; i < arr.length; i++) {

				List<AttendanceVO> list = aservice.selectByMno(mno, arr[i]);

				if (list.size() != 0) {
					list2.add("O");
				} else {
					list2.add(" ");
				}
				System.out.println(list2.get(i));
			}

			entity = new ResponseEntity<List<String>>(list2, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.OK);
		}

		return entity;
	}

	@RequestMapping(value = "/reclass", method = RequestMethod.GET)
	public ResponseEntity<Double> getReclass(int tno,String level) {
		logger.info("GET reclass");
		ResponseEntity<Double> entity = null;

		try {
			ClassVO vo=new ClassVO();
			vo.setTno(tno);
			vo.setLevel(level);
			int total = service.selectByTnoCount(vo);
			int re =  service.reenter(vo);
			
			double percent = 0.00;
			if (total == 0 || re == 0) {
				percent = 0;
			} else {
				if (re / total == 1) {
					percent = 100;
				} else {
					percent = ((double) re / (double) total) * 100;
				}

			}

			entity = new ResponseEntity<Double>(percent, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Double>(HttpStatus.OK);
		}

		return entity;
	}

}
