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

	@Override
	public MemberVO findMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.findMember(vo);
	}

	@Override
	public MemberVO findPW(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.findPw(vo);
	}

	@Override
	public void updatePw(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.updatePw(vo);
		
	}

	@Override
	public MemberVO findEmail(String email) {
		return dao.findEmail(email);
	}

	@Override
	public void updateEmailTell(MemberVO vo) {
		dao.updateEmailTell(vo);
		
	}

	@Override
	public void chagePw(String id, String pw) {
		dao.chagePw(pw, id);
	}

	@Override
	public void updateIsleave(String id) {
		dao.updateIsleave(id);
	}

	@Override
	public List<MemberVO> selectRegisterMember(int cno) {
		return dao.selectRegisterMember(cno);
	}

	@Override
	public MemberVO findIdBytell(String name, String tell,int age) {
		// TODO Auto-generated method stub
		return dao.findIdBytell(name, tell, age);
	}

	@Override
	public void updateEmail(String id, String email) {
		dao.updateEmail(id, email);
		
	}

}
