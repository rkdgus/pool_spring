package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ClassVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.ClassDAO;

@Service
public class ClassServiceImpl implements ClassService{
	
	@Autowired
	ClassDAO dao;

	@Override
	public ClassVO selectAll(int cno) {
		// TODO Auto-generated method stub
		return dao.selectAll(cno);
	}

	@Override
	public int countBytno(int tno,SearchCriteria cri) {
		return dao.countBytno(tno,cri);
	}

	@Override
	public List<ClassVO> selectAllClass(int tno,SearchCriteria cri) {
		return dao.selectAllClass(tno,cri);
	}

	@Override
	public int countBymno(int mno, SearchCriteria cri) {
		return dao.countBymno(mno, cri);
	}

	@Override
	public List<ClassVO> selectClassBymno(int mno, SearchCriteria cri) {
		return dao.selectClassBymno(mno, cri);
	}

}
