package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.AttendanceVO;

public interface AttendanceDAO {
	public List<AttendanceVO> selectByMno(int mno,String date);
	public List<AttendanceVO> selectByMnoAndDate(int mno,String date);
}
