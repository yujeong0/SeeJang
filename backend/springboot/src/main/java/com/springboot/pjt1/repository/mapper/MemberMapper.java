package com.springboot.pjt1.repository.mapper;

import java.util.List;

import com.springboot.pjt1.repository.dto.Member;

public interface MemberMapper {

	public List<Member> selectAllMember() throws Exception;
	
	public void insertMember(Member member) throws Exception;

	public void updateMemberInfo(Member member) throws Exception;
	
	public void deleteMember(String id) throws Exception;
	
	public Member selectMemberById(String id) throws Exception;
	
	public Member login(Member member) throws Exception;

	public int updateMemberGrade(Member member);
}
