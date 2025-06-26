package com.shinhan.memento.dao;

import java.util.List;

import com.shinhan.memento.dto.MypageKeepgoingHistoryDTO;

public interface MemberKeepgoingDAOInterface {
	
	public List<MypageKeepgoingHistoryDTO> showKeepgoingHistoryByMemberId(int memberId);
	
}
