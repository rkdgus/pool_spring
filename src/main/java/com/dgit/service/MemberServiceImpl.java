package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.MemberVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.MemberDAO;
import com.mysql.fabric.xmlrpc.base.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public MemberVO findMemberId(String id) {
		return dao.findMemberId(id);
	} 

	@Override
	public MemberVO selectMember(MemberVO vo) {
		return dao.selectMember(vo);
	}

	@Override
	public MemberVO selectMemberByMno(int mno) {
		return dao.selectMemberByMno(mno);
	}

	@Override
	public void updateIdPw(MemberVO vo) {
		dao.updateIdPw(vo);
	}

	@Override
	public List<MemberVO> selectMemberPage(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.selectMemberPage(cri);
	}

	@Override
	public int countByAll(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.countByAll(cri);
	}

}
