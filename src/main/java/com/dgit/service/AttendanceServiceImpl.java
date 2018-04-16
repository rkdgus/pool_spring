package com.dgit.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.AttendanceVO;
import com.dgit.persistence.AttendanceDAO;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private	AttendanceDAO dao;
	
	public static final AttendanceServiceImpl instance = new AttendanceServiceImpl();
	
	private AttendanceServiceImpl() {}

	@Override
	public AttendanceVO selectByMno(int mno,String Date) {
		return dao.selectByMno(mno,Date);
	}

	@Override
	public List<AttendanceVO> selectByMnoAndDate(int mno, String date) {
		return dao.selectByMnoAndDate(mno, date);
	}

}
