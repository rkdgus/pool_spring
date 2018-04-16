package com.dgit.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.AttendanceVO;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO{
	
	private static final String namespace = "com.dgit.mapper.AttendanceMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public AttendanceVO selectByMno(int mno,String date) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("mno",mno);
		map.put("date",date);
		return session.selectOne(namespace+".selectByMno",map);
	}

	
}
