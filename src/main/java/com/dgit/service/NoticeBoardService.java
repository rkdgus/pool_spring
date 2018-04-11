package com.dgit.service;

import java.util.List;

import com.dgit.domain.NoticeBoardVO;

public interface NoticeBoardService {
	public List<NoticeBoardVO>selectByAll(int page);
	public NoticeBoardVO read(int nno);
	public void create(NoticeBoardVO vo);
	public void modify(NoticeBoardVO vo);
	public void remove(int nno);
	public int count();
	public List<NoticeBoardVO> selectByMain();
}
 