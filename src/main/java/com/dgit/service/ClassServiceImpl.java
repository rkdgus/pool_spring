package com.dgit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ClassVO;
import com.dgit.persistence.ClassDAO;

@Service
public class ClassServiceImpl implements ClassService{
	
	@Autowired
	ClassDAO dao;

	@Override
	public ClassVO selectAll(int cno) {
		// TODO Auto-generated method stub
		return dao.selectAll(cno);
	}

}
