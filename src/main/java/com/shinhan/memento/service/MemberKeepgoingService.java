package com.shinhan.memento.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MemberKeepgoingDAO;
import com.shinhan.memento.dto.mypage.MypageKeepgoingHistoryDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberKeepgoingService {

	@Autowired
	MemberKeepgoingDAO memberKeepgoingDAO;
	
	public List<MypageKeepgoingHistoryDTO> showKeepgoingHistoryByMemberId(int memberId) {
		log.info("[MemberKeepgoingService.showKeepgoingHistory]");
		return memberKeepgoingDAO.showKeepgoingHistoryByMemberId(memberId);
	}
}
