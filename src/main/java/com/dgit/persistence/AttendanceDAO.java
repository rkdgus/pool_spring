package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.AttendanceVO;

public interface AttendanceDAO {
	public List<AttendanceVO> selectByMno(int mno);
	
}
