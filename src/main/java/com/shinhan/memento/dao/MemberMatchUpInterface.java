package com.shinhan.memento.dao;

import java.util.List;

import com.shinhan.memento.dto.mypage.MyJoinMatchupListResponseDTO;

public interface MemberMatchUpInterface {

	List<MyJoinMatchupListResponseDTO> selectJoinListByMemberId(Integer memberId);
}
