package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public List<TeacherVO> selectAll() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".selectAll");
	}

	@Override
	public void update(TeacherVO vo) {
		// TODO Auto-generated method stub
		session.update(namespace+".update", vo);
		
	}

	@Override
	public TeacherVO selectNo(int tno) {        
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectNo",tno);
	}

	@Override
	public List<TeacherVO> select(String title) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".select",title);
	}

	@Override
	public void updatePw(TeacherVO vo) {
		session.update(namespace+".updatePw",vo);
	}

	@Override
	public void updateTell(int tno, String tell) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("tno", tno);
		map.put("tell", tell);
		session.update(namespace+".updateTell",map);
		
	}

	@Override
	public void updateInfo(int tno, String info) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("tno", tno);
		map.put("info", info);
		session.update(namespace+".updateInfo",map);
	}

	@Override
	public TeacherVO findIdByTell(String name, int tno, String tell) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("tno", tno);
		map.put("tell", tell);
		return session.selectOne(namespace+".findIdByTell",map);
	}

	@Override
	public TeacherVO findIdByEmail(String name, int tno) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("name", name);
		map.put("tno", tno);
		return session.selectOne(namespace+".findIdByEmail",map);
	}
}
