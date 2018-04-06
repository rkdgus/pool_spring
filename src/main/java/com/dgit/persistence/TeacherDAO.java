package com.dgit.persistence;

import com.dgit.domain.TeacherVO;

public interface TeacherDAO {
	public TeacherVO findTeacherId(String id);
	public TeacherVO selectTeacher(TeacherVO vo);
}
 