package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.NoticeBoardVO;

public interface NoticeBoardDAO {
	public List<NoticeBoardVO>selectByAll(int page);
	public NoticeBoardVO read(int nno);
	public void insert(NoticeBoardVO vo);
	public void update(NoticeBoardVO vo);
	public void delete(int nno);
	public int countByAll();
}
 