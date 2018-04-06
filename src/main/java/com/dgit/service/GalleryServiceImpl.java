package com.dgit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.GalleryVO;
import com.dgit.persistence.GalleryDAO;

@Service
public class GalleryServiceImpl implements GalleryService{
	@Autowired
	private GalleryDAO dao;
	
	public static final GalleryServiceImpl instance = new GalleryServiceImpl();
	
	private GalleryServiceImpl() {}
	
	public static GalleryServiceImpl getInstance() {
		return instance;
	}
	@Override
	public void insertGallery(GalleryVO vo) {
		dao.insertGallery(vo);
	}
	
}
 