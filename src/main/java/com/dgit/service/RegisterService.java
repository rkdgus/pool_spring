package com.dgit.service;

import java.util.List;

import com.dgit.domain.ClassVO;
import com.dgit.domain.RegisterVO;

public interface RegisterService {
	public List<RegisterVO> selectAll(int mno);
	public List<RegisterVO> selectByCno(int cno);
	public int selectByTnoCount(ClassVO vo);
	public int reenter(ClassVO vo);
}
