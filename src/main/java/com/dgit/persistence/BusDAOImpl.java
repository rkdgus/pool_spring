package com.dgit.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BusDAOImpl implements BusDAO{
	
private static final String namespace = "com.dgit.mapper.BusMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public String selectAll() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectAll");
	}

	@Override
	public void update(String map) {
		// TODO Auto-generated method stub
		session.selectOne(namespace+".update",map);
		
	}


}
