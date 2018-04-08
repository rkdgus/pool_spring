package com.dgit.service;

import com.dgit.domain.MemberVO;

public interface MemberService {
	public MemberVO findMemberId(String id);
	public MemberVO selectMember(MemberVO vo);
	public MemberVO selectMemberByMno(int mno);
	public void updateIdPw(MemberVO vo);
}
 