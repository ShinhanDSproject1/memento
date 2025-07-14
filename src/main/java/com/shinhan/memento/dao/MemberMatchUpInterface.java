package com.shinhan.memento.dao;

import java.util.List;

import com.shinhan.memento.dto.mypage.MyMatchupListResponseDTO;

public interface MemberMatchUpInterface {

	List<MyMatchupListResponseDTO> selectJoinListByMemberId(Integer memberId);
}
