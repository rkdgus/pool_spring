package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;
@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {
	private static final String namespace = "com.dgit.mapper.QnaBoardMapper";
	
	@Autowired
	private SqlSession session;
	@Override
	public List<QnaBoardVO> selectByAll(SearchCriteria cri) {
		return session.selectList(namespace+".selectByAll",cri);
	}
  
	@Override
	public QnaBoardVO read(int bno,String pw) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("bno",bno );
		map.put("pw", pw);
		return session.selectOne(namespace+".read",map);
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
	public int countByAll(SearchCriteria cri) {
		return session.selectOne(namespace+".countByAll",cri);
	}

	@Override
	public void answerUpdate(QnaBoardVO vo) {
		session.update(namespace+".answerUpdate",vo);
	}

	@Override
	public QnaBoardVO selectByBno(int bno) {
		return session.selectOne(namespace+".selectByBno",bno);
	}
}
