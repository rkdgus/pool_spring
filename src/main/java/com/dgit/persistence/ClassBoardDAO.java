package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.ClassreplyVO;
import com.dgit.domain.SearchCriteria;

public interface ClassBoardDAO {
	public List<ClassBoardVO>selectByCno(int cno, SearchCriteria cri);
	public ClassBoardVO read(int bno);
	public void insert(ClassBoardVO vo);
	public void update(ClassBoardVO vo);
	public void delete(int bno);
	public int countByCno(int cno, SearchCriteria cri);
	public List<ClassVO> selectByClass();
	public void insertReply(ClassreplyVO vo);
	public void updateReply(ClassreplyVO vo);
	public void deleteReply(int rno);
	public List<ClassreplyVO> replySelectByBno(int bno);
}
 