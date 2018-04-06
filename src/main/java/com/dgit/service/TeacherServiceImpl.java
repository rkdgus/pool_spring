package com.dgit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.TeacherVO;
import com.dgit.persistence.TeacherDAO;

@Service
public class TeacherServiceImpl implements TeacherService {
	
	@Autowired
	TeacherDAO dao;
	
	@Override
	public TeacherVO findTeacherId(String id) {
		return dao.findTeacherId(id);
	}

	@Override
	public TeacherVO selectTeacher(TeacherVO vo) {
		return dao.selectTeacher(vo);
	} 

}
