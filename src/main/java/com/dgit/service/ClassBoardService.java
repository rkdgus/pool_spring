package com.dgit.service;

import java.util.List;	

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.ClassreplyVO;
import com.dgit.domain.SearchCriteria;

public interface ClassBoardService {
	public List<ClassBoardVO>selectByCno(int cno, SearchCriteria cri);
	public ClassBoardVO read(int bno);
	public void create(ClassBoardVO vo);
	public void modify(ClassBoardVO vo);
	public void remove(int bno);
	public int count(int cno, SearchCriteria cri);
	public List<ClassVO> selectByClass();
	public void createReply(ClassreplyVO vo);
	public void modifyReply(ClassreplyVO vo);
	public void removeReply(int rno);
	public List<ClassreplyVO> replySelectByBno(int bno); 
	public void readCnt(ClassBoardVO vo);
}
 