package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.ClassreplyVO;

public interface ClassBoardDAO {
	public List<ClassBoardVO>selectByCno(HashMap<String,Object> map);
	public ClassBoardVO read(int bno);
	public void insert(ClassBoardVO vo);
	public void update(ClassBoardVO vo);
	public void delete(int bno);
	public int countByCno(int cno);
	public List<ClassVO> selectByClass();
	public void insertReply(ClassreplyVO vo);
	public void updateReply(ClassreplyVO vo);
	public void deleteReply(int rno);
	public List<ClassreplyVO> replySelectByBno(int bno);
}
 