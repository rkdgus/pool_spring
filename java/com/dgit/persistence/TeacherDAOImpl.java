package com.dgit.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.TeacherVO;

@Repository
public class TeacherDAOImpl implements TeacherDAO {

	private static final String namespace = "com.dgit.mapper.TeacherMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public TeacherVO findTeacherId(String id) {
		
		return session.selectOne(namespace+".findTeacherId",id);
	}

	@Override
	public TeacherVO selectTeacher(TeacherVO vo) {
		return session.selectOne(namespace+".selectTeacher",vo);
	}

}
