package com.dgit.persistence;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ClassVO;
import com.dgit.domain.SearchCriteria;

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


	@Override
	public int countBytno(int tno,SearchCriteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("tno", tno);
		return session.selectOne(namespace+".countBytno",map);
	}


	@Override
	public List<ClassVO> selectAllClass(int tno,SearchCriteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("tno", tno);
		return session.selectList(namespace+".selectAllClass",map);
	}


	@Override
	public int countBymno(int mno, SearchCriteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		map.put("cri", cri);
		return session.selectOne(namespace+".countBymno",map);
	}


	@Override
	public List<ClassVO> selectClassBymno(int mno, SearchCriteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		map.put("cri", cri);
		return session.selectList(namespace+".selectClassBymno",map);
	}


	@Override
	public List<ClassVO> selectClassTno(int tno,String search, String s_day, SearchCriteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("tno", tno);
		map.put("s_day", s_day);
		map.put("cri", cri);
		map.put("search", search);
		return session.selectList(namespace+".selectClassTno",map);
	}


	@Override
	public List<ClassVO> selectByTno(int tno,String s_day) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("tno", tno);
		map.put("s_day", s_day);
		return session.selectList(namespace+".selectByTno",map);
	}
	public List<ClassVO> selectByTime(String time) {
		return session.selectList(namespace+".selectByTime",time);
	}
	@Override
	public ClassVO selectByTimeLevel(String time, String level) {
		HashMap<String,String> map = new HashMap<>();
		Date d = new Date();
		d.setDate(1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String s_day = sdf.format(d);
		map.put("time",time);
		map.put("level",level);
		map.put("s_day",s_day);
		
		return session.selectOne(namespace+".selectByTimeLevel",map);
	}

}
