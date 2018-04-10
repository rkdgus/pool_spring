package com.dgit.service;

import java.util.List;

import com.dgit.domain.QnaBoardVO;

public interface QnaBoardService {
	public List<QnaBoardVO>selectByAll(int page);
	public QnaBoardVO read(int bno,String pw);
	public void create(QnaBoardVO vo);
	public void modify(QnaBoardVO vo);
	public void remove(int bno);
	public int countByAll();
	public void modifyAnswer(QnaBoardVO vo);
	public QnaBoardVO selectByBno(int bno);
}
 