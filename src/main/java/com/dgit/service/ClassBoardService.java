package com.dgit.service;

import java.util.List;	

import com.dgit.domain.ClassBoardVO;

public interface ClassBoardService {
	public List<ClassBoardVO>selectByCno(int cno, int page);
	public ClassBoardVO read(int bno);
	public void create(ClassBoardVO vo);
	public void modify(ClassBoardVO vo);
	public void remove(int bno);
	public int count(int cno);
}
