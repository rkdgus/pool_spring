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
	public void updateTell(int tno,String tell);
	public void updateInfo(int tno,String info);
	public void updateImgpath(int tno,String imgpath);
	public TeacherVO findIdByTell(String name,String tell,int tno);
	public TeacherVO findIdByEmail(String name,int tno);
	public TeacherVO findTeacherInfo(TeacherVO vo);
}
 