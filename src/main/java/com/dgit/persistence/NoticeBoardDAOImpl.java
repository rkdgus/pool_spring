package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.NoticeBoardVO;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {
	private static final String namespace = "com.dgit.mapper.NoticeBoardMapper";
	
	@Autowired
	private SqlSession session;
	@Override
	public List<NoticeBoardVO> selectByAll(int page) {
		return session.selectList(namespace+".selectByAll",page);
	}
 
	@Override
	public NoticeBoardVO read(int nno) {
		return session.selectOne(namespace+".read",nno);
	}

	@Override
	public void insert(NoticeBoardVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(NoticeBoardVO vo) {
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(int nno) {
		session.delete(namespace+".delete",nno);
	}

	@Override
	public int countByAll() {
		return session.selectOne(namespace+".countByAll");
	}

	@Override
	public List<NoticeBoardVO> selectByMain() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".selectByMain");
	}

}
