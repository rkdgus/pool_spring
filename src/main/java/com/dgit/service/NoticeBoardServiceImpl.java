package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.NoticeBoardVO;
import com.dgit.persistence.NoticeBoardDAO;
@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	@Autowired
	private NoticeBoardDAO dao;
	public static final NoticeBoardServiceImpl instance = new NoticeBoardServiceImpl();
	
	private NoticeBoardServiceImpl() {}

	public static NoticeBoardServiceImpl getInstance() {
		return instance;
	} 

	@Override
	public List<NoticeBoardVO> selectByAll(int page) {
		return dao.selectByAll(page);
	}

	@Override
	public NoticeBoardVO read(int nno) {
		return dao.read(nno);
	}

	@Override
	public void create(NoticeBoardVO vo) {
		dao.insert(vo);
	}

	@Override
	public void modify(NoticeBoardVO vo) {
		dao.update(vo);
	}

	@Override
	public void remove(int nno) {
		dao.delete(nno);
	}

	@Override
	public int count() {
		return dao.countByAll();
	}

	@Override
	public List<NoticeBoardVO> selectByMain() {
		// TODO Auto-generated method stub
		return dao.selectByMain();
	}

}
