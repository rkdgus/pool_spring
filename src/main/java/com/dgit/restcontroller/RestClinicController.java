package com.dgit.restcontroller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.ClinicVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ClinicService;

@RestController
@RequestMapping("/restclinic/*")
public class RestClinicController {
	private static final Logger logger = LoggerFactory.getLogger(RestBusController.class);
	
	@Autowired
	private ClinicService service;
	
	@RequestMapping(value = "/clinic", method = RequestMethod.GET)
	public ResponseEntity<HashMap<String,Object>> bus(SearchCriteria cri) {
		ResponseEntity<HashMap<String,Object>> entity = null;
		HashMap<String,Object> map = new HashMap<>();
		String[] typeName = {"freestyle","backstroke","breaststroke","butterfly","startAndTrun"};
		
		try{
			for(int i=0; i< 5; i++){
				String name = "list_"+i;
				cri.setSearchType(typeName[i]);
				List<ClinicVO> lists = service.list(cri);
				map.put(name,lists);
			}
			entity = new ResponseEntity<HashMap<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
		}
		return entity;
		
	}
}
