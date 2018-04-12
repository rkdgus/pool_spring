package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.MemberVO;
import com.dgit.domain.SearchCriteria;
import com.mysql.fabric.xmlrpc.base.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final String namespace = "com.dgit.mapper.MemberMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public MemberVO findMemberId(String id) {
		return session.selectOne(namespace+".findMemberId",id);
	} 

	@Override
	public MemberVO selectMember(MemberVO vo) {
		return session.selectOne(namespace+".selectMember",vo);
	}

	@Override
	public MemberVO selectMemberByMno(int mno) {
		return session.selectOne(namespace+".selectMemberByMno",mno);
	}

	@Override
	public void updateIdPw(MemberVO vo) {
		session.update(namespace+".updateIdPw",vo);
	}


	@Override
	public int countByAll(SearchCriteria cri) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		return session.selectOne(namespace+".countByAll",map);
	}

	@Override
	public List<MemberVO> selectMemberPage(SearchCriteria cri) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		return session.selectList(namespace+".selectMemberPage",map);
		
	}

	@Override
	public MemberVO findMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".findMember",vo);
	}

}
