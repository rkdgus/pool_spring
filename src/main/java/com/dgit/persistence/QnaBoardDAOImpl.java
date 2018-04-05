package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.QnaBoardVO;
@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {
	private static final String namespace = "com.dgit.mapper.QnaBoardMapper";
	
	@Autowired
	private SqlSession session;
	@Override
	public List<QnaBoardVO> selectByAll(int page) {
		return session.selectList(namespace+".selectByAll",page);
	}
  
	@Override
	public QnaBoardVO read(int bno) {
		return session.selectOne(namespace+".read",bno);
	}

	@Override
	public void insert(QnaBoardVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(QnaBoardVO vo) {
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(int bno) {
		session.delete(namespace+".delete",bno);
	}

	@Override
	public int countByAll() {
		return session.selectOne(namespace+".countByAll");
	}

	@Override
	public void answerUpdate(QnaBoardVO vo) {
		session.update(namespace+".answerUpdate",vo);
	}
}
