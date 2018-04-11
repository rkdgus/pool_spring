package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.RegisterVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO {
	private static final String namespace = "com.dgit.mapper.RegisterMapper";

	@Autowired
	private SqlSession session;

	@Override
	public List<RegisterVO> selectAll(int mno) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".selectAll",mno);
	}

}
