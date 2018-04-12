package com.dgit.service;

import java.util.List;

import com.dgit.domain.ClinicVO;
import com.dgit.domain.SearchCriteria;

public interface ClinicService {
	public List<ClinicVO> list(SearchCriteria cri);
	public int count(SearchCriteria cri);
	public ClinicVO read(int no);
	public void create(ClinicVO vo);
	public void remove(int no);
	public void modify(ClinicVO vo);
}
