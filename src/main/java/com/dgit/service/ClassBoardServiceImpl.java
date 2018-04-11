package com.dgit.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.ClassreplyVO;
import com.dgit.domain.SearchCriteria;
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
	public List<ClassBoardVO> selectByCno(int cno, SearchCriteria cri) {
		return dao.selectByCno(cno,cri);
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
	public int count(int cno, SearchCriteria cri) {
		return dao.countByCno(cno,cri);
	}
 
	@Override
	public List<ClassVO> selectByClass() {
		return dao.selectByClass();
	}

	@Override
	public void createReply(ClassreplyVO vo) {
		dao.insertReply(vo);
	}

	@Override
	public void modifyReply(ClassreplyVO vo) {
		dao.updateReply(vo);
	}

	@Override
	public void removeReply(int rno) {
		dao.deleteReply(rno);
	}

	@Override
	public List<ClassreplyVO> replySelectByBno(int bno) {
		return dao.replySelectByBno(bno);
	}

}
