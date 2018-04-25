package com.dgit.restcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.MemberVO;
import com.dgit.service.MemberService;

@RestController
@RequestMapping("/restInfoUpdate/*")
public class RestInfoUpdateController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestInfoUpdateController.class);
	
	@Autowired
	MemberService mService;
	
	
	@RequestMapping(value="/isleave",method = RequestMethod.POST)
	public ResponseEntity<String> isleave(String pw,String id){
		
		logger.info("================ isleave member post =========");
		ResponseEntity<String> entity = null;
		
		try{
			MemberVO vo = new MemberVO();
			vo.setPw(pw);
			vo.setId(id);
			MemberVO m = mService.selectMember(vo);
			if(m==null){
				entity = new ResponseEntity<String>("fail",HttpStatus.OK);
			}else{
				mService.updateIsleave(id);
				entity = new ResponseEntity<String>("bye",HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
}
