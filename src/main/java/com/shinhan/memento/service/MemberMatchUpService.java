package com.shinhan.memento.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MemberMatchUpDAO;
import com.shinhan.memento.dto.MyMatchupListResponseDTO;

@Service
public class MemberMatchUpService {
	@Autowired
	MemberMatchUpDAO memberMatchUpDAO;
	
	public List<MyMatchupListResponseDTO> selectJoinListByMemberId(Integer memberId){		
		return memberMatchUpDAO.selectJoinListByMemberId(memberId);
	}
}
