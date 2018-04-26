package com.dgit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.persistence.BusDAO;

@Service
public class BusServiceImpl implements BusService {
	
	@Autowired
	BusDAO dao;

	@Override
	public String selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public void update(String map) {
		// TODO Auto-generated method stub
		dao.update(map);
	}
	
	
}
