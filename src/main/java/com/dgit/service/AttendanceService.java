package com.dgit.service;

import java.util.Date;
import java.util.List;

import com.dgit.domain.AttendanceVO;

public interface AttendanceService {
	
	public List<AttendanceVO> selectByMno(int mno,String date);
	public List<AttendanceVO> selectByMnoAndDate(int mno,String date);
}
