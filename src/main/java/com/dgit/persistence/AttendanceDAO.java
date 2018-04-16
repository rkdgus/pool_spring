package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.AttendanceVO;

public interface AttendanceDAO {
	public AttendanceVO selectByMno(int mno,String Date);
	public List<AttendanceVO> selectByMnoAndDate(int mno,String date);
}
