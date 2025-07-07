package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shinhan.memento.dto.mentos.JoinMentosDTO;
import com.shinhan.memento.mapper.MemberMentosMapper;
import com.shinhan.memento.model.MemberMentos;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberMentosService {

	@Autowired
	MemberMentosMapper memberMentosMapper;

	/**
	 * 멘토스 참여하기(신청하기)
	 */
	@Transactional
	public int joinMentos(JoinMentosDTO joinMentoDto) {
		log.info("[MemberMentosService.joinMentos]");
		return memberMentosMapper.joinMentos(joinMentoDto);
	}
	
	// memberId, mentosId 로 유효한 member_mentos 가 있는지 확인 
	public MemberMentos checkValidMemberMentos(JoinMentosDTO joinMentoDto) {
		log.info("[MemberMentosService.checkValidMemberMentos]");
		return memberMentosMapper.findMemberMentosById(joinMentoDto);
	}
	
	/**
	 * 멘토스 참여 취소(신청 취소하기)
	 */
	@Transactional
	public int cancelJoinMentos(int memberMentosId) {
		log.info("[MemberMentosService.cancelJoinMentos]");
		return memberMentosMapper.cancelJoinMentos(memberMentosId);
	}
}
