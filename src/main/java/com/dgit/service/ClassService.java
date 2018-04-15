package com.dgit.service;

import java.util.List;

import com.dgit.domain.ClassVO;
import com.dgit.domain.SearchCriteria;

public interface ClassService {
	public ClassVO selectAll(int cno);
	public int countBytno(int tno,SearchCriteria cri);
	public List<ClassVO> selectAllClass(int tno,SearchCriteria cri);
}
