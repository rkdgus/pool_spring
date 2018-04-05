package com.dgit.persistence;

import com.dgit.domain.MemberVO;

public interface MemberDAO {
	public MemberVO findMemberId(String id);
	public MemberVO selectMember(MemberVO vo);
}
 