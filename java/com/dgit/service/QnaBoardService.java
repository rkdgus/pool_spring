package com.dgit.service;

import java.util.List;

import com.dgit.domain.QnaBoardVO;

public interface QnaBoardService {
	public List<QnaBoardVO>selectByAll(int page);
	public QnaBoardVO read(int bno);
	public void create(QnaBoardVO vo);
	public void modify(QnaBoardVO vo);
	public void remove(int bno);
	public int count(int cno);
	public void modifyAnswer(QnaBoardVO vo);
}
 