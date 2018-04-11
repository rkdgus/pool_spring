package com.dgit.service;

import java.util.List;

import com.dgit.domain.RegisterVO;

public interface RegisterService {
	public List<RegisterVO> selectAll(int mno);
}
