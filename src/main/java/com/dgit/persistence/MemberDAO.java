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
	public MemberVO findPw(MemberVO vo);
	public void updatePw(MemberVO vo);
	public MemberVO findEmail(String email);
	public void updateEmailTell(MemberVO vo);
	public void chagePw(String pw,String id);
	public void updateIsleave(String id);
	public List<MemberVO> selectRegisterMember(int cno);
	public MemberVO findIdBytell(String name,String tell,int age);
	public void updateEmail(String id,String email);
	public void updateTell(String tell,int mno);
	public MemberVO selectfindPw(MemberVO vo);
}
 