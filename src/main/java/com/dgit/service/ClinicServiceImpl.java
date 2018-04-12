package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ClinicVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.ClinicDAO;
import com.dgit.persistence.GalleryDAO;

@Service
public class ClinicServiceImpl implements ClinicService {
	@Autowired
	private ClinicDAO dao;
	
	public static final ClinicServiceImpl instance = new ClinicServiceImpl();
	
	private ClinicServiceImpl() {}
	@Override
	public List<ClinicVO> list(SearchCriteria cri) {
		return dao.selectByList(cri);
	}

	@Override
	public int count(SearchCriteria cri) {
		return dao.count(cri);
	}

	@Override
	public ClinicVO read(int no) {
		return dao.selectByNo(no);
	}

	@Override
	public void create(ClinicVO vo) {
		dao.insert(vo);
	}

	@Override
	public void remove(int no) {
		dao.delete(no);
	}

	@Override
	public void modify(ClinicVO vo) {
		dao.update(vo);
	}

}
