package com.dgit.service;

import java.util.List;

import com.dgit.domain.ClassVO;
import com.dgit.domain.SearchCriteria;

public interface ClassService {
	public ClassVO selectAll(int cno);
	public int countBytno(int tno,SearchCriteria cri);
	public List<ClassVO> selectAllClass(int tno,SearchCriteria cri);
	public int countBymno(int mno,SearchCriteria cri);
	public List<ClassVO> selectClassBymno(int mno,SearchCriteria cri);
	public List<ClassVO> selectClassTno(int tno,String search, String s_day, SearchCriteria cri);
	public List<ClassVO> selectByTno(int tno);
	public List<ClassVO> selectByTime(String time);
	public ClassVO selectByTimeLevel(String time,String level);
}
