package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ClassBoardVO;

@Repository
public class ClassBoardDAOImpl implements ClassBoardDAO{
	private static final String namespace = "com.dgit.mapper.ClassBoardMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ClassBoardVO> selectByCno(HashMap<String,Object> map) {
		return session.selectList(namespace+".selectByCno",map);
	}

	@Override
	public ClassBoardVO read(int bno) {
		return session.selectOne(namespace+".read",bno);
	}

	@Override
	public void insert(ClassBoardVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(ClassBoardVO vo) {
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(int bno) {
		session.delete(namespace+".delete",bno);
	}

	@Override
	public int countByCno(int cno) {
		return session.selectOne(namespace+".countByCno",cno);
	}
}
