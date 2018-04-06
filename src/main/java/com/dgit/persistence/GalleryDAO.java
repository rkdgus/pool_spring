package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.GalleryVO;

public interface GalleryDAO {
	public void insert(GalleryVO vo);
	public List<GalleryVO> selectAll();
}
