package com.dgit.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ClassVO;

@Repository
public class ClassDAOImpl implements ClassDAO{
	private static final String namespace = "com.dgit.mapper.ClassMapper";

	@Autowired
	private SqlSession session;


	@Override
	public ClassVO selectAll(int cno) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectAll", cno);
	}

}
