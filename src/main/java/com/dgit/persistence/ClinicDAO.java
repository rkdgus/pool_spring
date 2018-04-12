package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ClinicVO;
import com.dgit.domain.SearchCriteria;

public interface ClinicDAO {
	public List<ClinicVO> selectByList(SearchCriteria cri);
	public int count(SearchCriteria cri);
	public ClinicVO selectByNo(int no);
	public void insert(ClinicVO vo);
	public void delete(int no);
	public void update(ClinicVO vo);
}