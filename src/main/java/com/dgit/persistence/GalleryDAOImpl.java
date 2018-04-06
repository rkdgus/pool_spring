package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.GalleryVO;
@Repository
public class GalleryDAOImpl implements GalleryDAO{
private static final String namespace = "com.dgit.mapper.GalleryMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public void insert(GalleryVO vo) {
		// TODO Auto-generated method stub
		session.insert(namespace+".insert",vo);
	}

	@Override
	public List<GalleryVO> selectAll() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".selectAll");
	}

}
