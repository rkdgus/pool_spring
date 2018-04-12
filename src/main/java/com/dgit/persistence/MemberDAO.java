package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.MemberVO;
import com.dgit.domain.SearchCriteria;

public interface MemberDAO {
	public MemberVO findMemberId(String id);
	public MemberVO selectMember(MemberVO vo);
	public MemberVO selectMemberByMno(int mno);
	public void updateIdPw(MemberVO vo);
	public List<MemberVO> selectMemberPage(SearchCriteria cri);
	public int countByAll(SearchCriteria cri); 
	public MemberVO findMember(MemberVO vo);
}
 