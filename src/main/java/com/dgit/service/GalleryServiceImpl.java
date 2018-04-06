package com.dgit.service;

import java.util.List;

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
	public void insert(GalleryVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<GalleryVO> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}
	
}             
 