package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ClassBoardVO;
import com.dgit.domain.ClassVO;
import com.dgit.domain.ClassreplyVO;
import com.dgit.domain.RegisterVO;
import com.dgit.domain.SearchCriteria;

public interface RegisterDAO {
	public List<RegisterVO> selectAll(int mno);
	public List<RegisterVO> selectByCno(int cno);

}
 