package com.dgit.persistence;


import java.util.List;

import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;

public interface QnaBoardDAO {
	public List<QnaBoardVO>selectByAll(SearchCriteria cri);
	public QnaBoardVO read(int bno,String pw);
	public void insert(QnaBoardVO vo);
	public void update(QnaBoardVO vo);
	public void delete(int bno);
	public int countByAll(SearchCriteria cri);
	public void answerUpdate(QnaBoardVO vo);
	public QnaBoardVO selectByBno(int bno);
	public List<QnaBoardVO> selectbyIdQna(String id, SearchCriteria cri);
	public int selectbyIdCount(String id);
}
 