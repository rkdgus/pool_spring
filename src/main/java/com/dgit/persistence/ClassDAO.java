package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ClassVO;
import com.dgit.domain.SearchCriteria;

public interface ClassDAO {
	public ClassVO selectAll(int cno);
	public int countBytno(int tno,SearchCriteria cri);
	public List<ClassVO> selectAllClass(int tno,SearchCriteria cri);
	
}
