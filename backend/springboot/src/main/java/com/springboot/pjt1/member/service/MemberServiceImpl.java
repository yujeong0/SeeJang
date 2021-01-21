package com.springboot.pjt1.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.pjt1.repository.dto.Member;
import com.springboot.pjt1.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper mapper;
	
	@Override
	public void insertMember(Member member) throws Exception{
		mapper.insertMember(member);
	};

	@Override
	public void updateMemberInfo(Member member) throws Exception {
		mapper.updateMemberInfo(member);
	};
	
	@Override
	public void deleteMember(String id) throws Exception {
		mapper.deleteMember(id);
	};
	
	@Override
	public Member selectMemberById(String id) throws Exception {
		return mapper.selectMemberById(id);
	};
	
	@Override
	public Member login(Member member) throws Exception {
		return mapper.login(member);
	}



	
}
