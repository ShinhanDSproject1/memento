package com.shinhan.memento.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shinhan.memento.dao.MatchUpDAO;
import com.shinhan.memento.dto.MatchUpDTO;

@Service
public class MatchupService {

	@Autowired
	MatchUpDAO matchUpDAO;

	public List<MatchUpDTO> getMatchupList(Map<String, Object> filters) {
		List<MatchUpDTO> matchups = matchUpDAO.getMatchupList(filters);
		
		for (MatchUpDTO matchup : matchups) {
			int currentMemberCount = matchUpDAO.getActiveMemberCount(matchup.getMatchup_id());
			matchup.setCount(currentMemberCount);
			
			if (matchup.getMax_member() != null && currentMemberCount >= matchup.getMax_member()) {
				matchup.setRecruit("모집완료");
			} else if (matchup.getMax_member() != null && currentMemberCount >= (matchup.getMax_member() - 2)) {
				matchup.setRecruit("마감임박");
			} else {
				matchup.setRecruit("모집중");
			}
		}
		return matchups;
	}

	public MatchUpDTO getMatchupDetail(int id) {
		MatchUpDTO matchupDetail = matchUpDAO.getMatchupDetail(id); 
		
		if (matchupDetail == null) {
			throw new IllegalArgumentException("매치업을 찾을 수 없습니다. id: " + id);
		} else {
			int currentMemberCount = matchUpDAO.getActiveMemberCount(matchupDetail.getMatchup_id());
			matchupDetail.setCount(currentMemberCount);
			
			if (matchupDetail.getMax_member() != null && currentMemberCount >= matchupDetail.getMax_member()) {
				matchupDetail.setRecruit("모집완료");
			} else if (matchupDetail.getMax_member() != null && currentMemberCount >= (matchupDetail.getMax_member() - 2)) {
				matchupDetail.setRecruit("마감임박");
			} else {
				matchupDetail.setRecruit("모집중");
			}
		}
		return matchupDetail;
	}
}