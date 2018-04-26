package com.dgit.restcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.service.BusService;

@RestController
@RequestMapping("/bus/*")
public class RestBusController {
	private static final Logger logger = LoggerFactory.getLogger(RestBusController.class);


	@Autowired
	private BusService service;


	@RequestMapping(value = "/bus", method = RequestMethod.GET)
	public ResponseEntity<String> bus(String map) {
		logger.info("busbusbus");
		ResponseEntity<String> entity = null;

		try {
			service.update(map);
			String s =service.selectAll();

			entity = new ResponseEntity<String>(s, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}

		return entity;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ResponseEntity<String> getClasslist(String map) {
		logger.info("bus");
		ResponseEntity<String> entity = null;

		try {

			String s =service.selectAll();

			entity = new ResponseEntity<String>(s, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}

		return entity;
	}



}
