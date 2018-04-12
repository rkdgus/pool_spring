package com.dgit.service;

import java.util.List;

import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;

public interface QnaBoardService {
	public List<QnaBoardVO>selectByAll(SearchCriteria cri);
	public QnaBoardVO read(int bno,String pw);
	public void create(QnaBoardVO vo);
	public void modify(QnaBoardVO vo);
	public void remove(int bno);
	public int countByAll(SearchCriteria cri);
	public void modifyAnswer(QnaBoardVO vo);
	public QnaBoardVO selectByBno(int bno);
	public void answerUpdate(QnaBoardVO vo); 
}
 