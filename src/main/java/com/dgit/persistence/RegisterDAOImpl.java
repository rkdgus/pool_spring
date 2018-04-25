package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ClassVO;
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

	@Override
	public List<RegisterVO> selectByCno(int cno) {
		return session.selectList(namespace+".selectByCno",cno);
	}

	@Override
	public int selectByTnoCount(ClassVO vo) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectByTnoCount",vo);
	}

	@Override
	public int reenter(ClassVO vo) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".reenter",vo);
	}

}
