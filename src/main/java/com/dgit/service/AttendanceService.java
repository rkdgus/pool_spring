package com.dgit.service;

import java.util.List;

import com.dgit.domain.AttendanceVO;

public interface AttendanceService {
	
	public List<AttendanceVO> selectByMno(int mno);

}
