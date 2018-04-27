package com.dgit.service;

import java.util.List;

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

	@Override
	public List<TeacherVO> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public void update(TeacherVO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public TeacherVO selectNo(int tno) {
		// TODO Auto-generated method stub
		return dao.selectNo(tno);
	}

	@Override
	public List<TeacherVO> select(String title) {
		// TODO Auto-generated method stub
		return dao.select(title);
	}

	@Override
	public void updatePw(TeacherVO vo) {
		dao.updatePw(vo);
	}

	@Override
	public void updateTell(int tno, String tell) {
		dao.updateTell(tno, tell);
		
	}

	@Override
	public void updateInfo(int tno, String info) {
		dao.updateInfo(tno, info);
	}
}
