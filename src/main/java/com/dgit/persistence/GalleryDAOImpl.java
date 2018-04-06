package com.dgit.persistence;

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
	public void insertGallery(GalleryVO vo) {
		// TODO Auto-generated method stub
		session.insert(namespace+".insertGallery",vo);
	}

}
