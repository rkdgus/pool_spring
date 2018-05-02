package com.dgit.persistence;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.ClassreplyVO;
import com.dgit.domain.SearchCriteria;

@Repository
public class ClassBoardDAOImpl implements ClassBoardDAO{
	private static final String namespace = "com.dgit.mapper.ClassBoardMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ClassBoardVO> selectByCno(int cno, SearchCriteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cno",cno);
		map.put("cri",cri);
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
	public int countByCno(int cno, SearchCriteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cno",cno);
		map.put("cri",cri);
		return session.selectOne(namespace+".countByCno",map);
	}
 
	@Override
	public List<ClassVO> selectByClass() {
		Date d = new Date();
		d.setDate(1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String s_day = sdf.format(d);
		return session.selectList(namespace+".selectByClass",s_day);
	}

	@Override
	public void insertReply(ClassreplyVO vo) {
		session.insert(namespace+".insertReply",vo);
	}

	@Override
	public void updateReply(ClassreplyVO vo) {
		session.update(namespace+".updateReply",vo);
	}

	@Override
	public void deleteReply(int rno) {
		session.delete(namespace+".deleteReply",rno);
	}

	@Override
	public List<ClassreplyVO> replySelectByBno(int bno) {
		return session.selectList(namespace+".replySelectByBno",bno);
	}

	@Override
	public void readCnt(ClassBoardVO vo) {
		session.update(namespace+".readCnt",vo);
		
	}
}
