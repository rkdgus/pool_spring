package com.dgit.service;

import java.util.List;

import com.dgit.domain.GalleryVO;

public interface GalleryService {
	public void insert(GalleryVO vo);
	public List<GalleryVO> selectAll();
}
 