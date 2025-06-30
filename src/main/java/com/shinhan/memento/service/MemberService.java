package com.shinhan.memento.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.mapper.MemberMapper;
import com.shinhan.memento.model.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	
	public Member findMemberById(Map<String, Object> params) {
		log.info("[MemberService.findMemberById]");
		return memberMapper.findMemberById(params);
	}
}
