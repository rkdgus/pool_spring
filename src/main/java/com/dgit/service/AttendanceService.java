package com.dgit.service;

import java.util.Date;
import java.util.List;

import com.dgit.domain.AttendanceVO;

public interface AttendanceService {
	
	public AttendanceVO selectByMno(int mno,String Date);
	public List<AttendanceVO> selectByMnoAndDate(int mno,String date);
}
