package com.dgit.service;

import com.dgit.domain.TeacherVO;

public interface TeacherService {
	public TeacherVO findTeacherId(String id);
	public TeacherVO selectTeacher(TeacherVO vo);
}
