package com.dgit.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.persistence.ClassBoardDAO;
@Service
public class ClassBoardServiceImpl implements ClassBoardService {
	@Autowired
	private ClassBoardDAO dao;
	
	public static final ClassBoardServiceImpl instance = new ClassBoardServiceImpl();
	
	private ClassBoardServiceImpl() {}
	
	public static ClassBoardServiceImpl getInstance() {
		return instance;
	}

	@Override
	public List<ClassBoardVO> selectByCno(int cno, int page) {
		HashMap<String,Object> map = new HashMap<>();
		page = page * 15;
		map.put("cno",cno);
		map.put("page",page);
		return dao.selectByCno(map);
	}

	@Override
	public ClassBoardVO read(int bno) {
		
		return dao.read(bno);
	}

	@Override
	public void create(ClassBoardVO vo) {
		dao.insert(vo);

	}

	@Override
	public void modify(ClassBoardVO vo) {
		dao.update(vo);

	}

	@Override
	public void remove(int bno) {
		dao.delete(bno);

	}

	@Override
	public int count(int cno) {
		return dao.countByCno(cno);
	}

	@Override
	public List<ClassVO> selectByClass() {
		return dao.selectByClass();
	}

}
