package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MemberDAO;
import com.shinhan.memento.model.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	/**
	 * memberId 로 그런 유저가 있는지 찾는 메소드
	 */
	public Member selectMemberById(int memberId) {
		log.info("[MemberService.selectMemberById]");
		return memberDAO.selectMemberById(memberId);
	}
}
