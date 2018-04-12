package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.dgit.domain.ClinicVO;
import com.dgit.domain.SearchCriteria;

@Repository
public class ClinicDAOImpl implements ClinicDAO{	
	private static final String namespace = "com.dgit.mapper.ClinicMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ClinicVO> selectByList(SearchCriteria cri){
		return session.selectList(namespace+".selectByList",cri);
	}

	@Override
	public int count(SearchCriteria cri) {
		return session.selectOne(namespace+".count",cri);
	}

	@Override
	public ClinicVO selectByNo(int no) {
		return session.selectOne(namespace+".selectByNo",no);
	}

	@Override
	public void insert(ClinicVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void delete(int no) {
		session.delete(namespace+".delete",no);
	}

	@Override
	public void update(ClinicVO vo) {
		session.update(namespace+".update",vo);
	}

}
