package com.dgit.service;

import java.util.List;

import com.dgit.domain.TeacherVO;

public interface TeacherService {
	public TeacherVO findTeacherId(String id);
	public TeacherVO selectTeacher(TeacherVO vo);
	public List<TeacherVO> selectAll();
	public void update(TeacherVO vo);
	public TeacherVO selectNo(int tno);
	public List<TeacherVO> select(String title);
	public void updatePw(TeacherVO vo);
}
 