package com.shinhan.memento.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shinhan.memento.dao.MatchUpDAO;
import com.shinhan.memento.dto.MatchUpDTO;
import com.shinhan.memento.dto.MatchupDetailDTO;
import com.shinhan.memento.dto.MatchupListDTO;

@Service
public class MatchupService {

	@Autowired
	MatchUpDAO matchUpDAO;

	public List<MatchupListDTO> getMatchupList(Map<String, Object> filters) {
		List<MatchupListDTO> matchups = matchUpDAO.getMatchupList(filters);
		
		for (MatchupListDTO matchup : matchups) {
			int currentMemberCount = matchUpDAO.getActiveMemberCount(matchup.getMatchup_id()); /* 현재 신청 인원 */
			matchup.setCount(currentMemberCount);
			
			String categoryName = matchUpDAO.getCategoryName(matchup.getCategory_id()); /* 카테고리 이름 */
			matchup.setCategoryName(categoryName);
			
			String languageName = matchUpDAO.getLanguageName(matchup.getLanguage_id()); /* 언어 이름 */
			matchup.setLanguageName(languageName);
			
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

	public MatchupDetailDTO getMatchupDetail(int id) {
		MatchupDetailDTO matchupDetail = matchUpDAO.getMatchupDetail(id); 
		
		if (matchupDetail == null) {
			throw new IllegalArgumentException("매치업을 찾을 수 없습니다. id: " + id);
		} else {
			
			int currentMemberCount = matchUpDAO.getActiveMemberCount(matchupDetail.getMatchup_id());  /* 현재 신청 인원 */
			matchupDetail.setCount(currentMemberCount);
			
			String categoryName = matchUpDAO.getCategoryName(matchupDetail.getCategory_id()); /* 카테고리 이름 */
			matchupDetail.setCategoryName(categoryName);
			
			String languageName = matchUpDAO.getLanguageName(matchupDetail.getLanguage_id()); /* 언어 이름 */
		    matchupDetail.setLanguageName(languageName);
		    
		    String matchTypeFirstName = matchUpDAO.getMatchTypeName(matchupDetail.getMatch_type_first()); 	/* 첫 번째 유형 이름 */
		    String matchTypeSecondName = matchUpDAO.getMatchTypeName(matchupDetail.getMatch_type_second()); /* 두 번째 유형 이름 */
		    String matchTypeThirdName = matchUpDAO.getMatchTypeName(matchupDetail.getMatch_type_third()); 	/* 세 번째 유형 이름 */
		    
		    matchupDetail.setMatchTypeFirstName(matchTypeFirstName);
		    matchupDetail.setMatchTypeSecondName(matchTypeSecondName);
		    matchupDetail.setMatchTypeThirdName(matchTypeThirdName);
			
		}
		return matchupDetail;
	}
	
	public int createMatchup(MatchUpDTO matchup) {
	    return matchUpDAO.createMatchup(matchup);
	}
}