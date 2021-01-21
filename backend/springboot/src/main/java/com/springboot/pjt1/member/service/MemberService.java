package com.springboot.pjt1.member.service;

import com.springboot.pjt1.repository.dto.Member;

public interface MemberService {

	void insertMember(Member member) throws Exception;

	void updateMemberInfo(Member member) throws Exception;

	void deleteMember(String id) throws Exception;

	Member selectMemberById(String id) throws Exception;

	Member login(Member member) throws Exception;
	

}