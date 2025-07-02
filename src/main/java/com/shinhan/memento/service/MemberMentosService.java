package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shinhan.memento.dto.JoinMentosDTO;
import com.shinhan.memento.mapper.MemberMentosMapper;

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
		log.info("[MentosService.joinMentos]");
		return memberMentosMapper.joinMentos(joinMentoDto);
	}
}
