package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.RegisterVO;
import com.dgit.persistence.RegisterDAO;

@Service
public class RegisterServiceImpl implements RegisterService{
	
	@Autowired
	RegisterDAO dao;

	@Override
	public List<RegisterVO> selectAll(int mno) {
		// TODO Auto-generated method stub
		return dao.selectAll(mno);
	}
}
