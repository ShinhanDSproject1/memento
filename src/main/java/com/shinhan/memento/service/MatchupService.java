package com.shinhan.memento.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shinhan.memento.dao.MatchUpDAO;
import com.shinhan.memento.dao.MemberMatchUpDAO;
import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.MatchUp;
import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.MatchupCreateDTO;
import com.shinhan.memento.dto.MatchupDetailDTO;
import com.shinhan.memento.dto.MatchupListDTO;
import com.shinhan.memento.dto.MatchupUpdateDTO;

@Service
public class MatchupService {

	@Autowired
	MatchUpDAO matchUpDAO;
	@Autowired
	MemberMatchUpDAO memberMatchUpDAO;

	public List<MatchupListDTO> getMatchupList(Map<String, Object> filters) {
		List<MatchupListDTO> matchups = matchUpDAO.getMatchupList(filters);
		
		for (MatchupListDTO matchup : matchups) {
			int currentMemberCount = matchUpDAO.getActiveMemberCount(matchup.getMatchupId()); /* 현재 신청 인원 */
			matchup.setMatchupCount(currentMemberCount);
			
			if (matchup.getCategoryId() != null) {
			    String categoryName = matchUpDAO.getCategoryName(matchup.getCategoryId()); /* 카테고리 이름 */
			    matchup.setCategoryName(categoryName);
			}
			
			if (matchup.getLanguageId() != null) {
			    String languageName = matchUpDAO.getLanguageName(matchup.getLanguageId()); /* 언어 이름 */
			    matchup.setLanguageName(languageName);
			}
			
			if (matchup.getMaxMember() != null && currentMemberCount >= matchup.getMaxMember()) {
				matchup.setRecruit("모집완료");
			} else if (matchup.getMaxMember() != null && currentMemberCount >= (matchup.getMaxMember() - 2)) {
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
			
			int currentMemberCount = matchUpDAO.getActiveMemberCount(matchupDetail.getMatchupId());  /* 현재 신청 인원 */
			matchupDetail.setMatchupCount(currentMemberCount);
			
			if (matchupDetail.getCategoryId() != null) {
				String categoryName = matchUpDAO.getCategoryName(matchupDetail.getCategoryId()); /* 카테고리 이름 */
				matchupDetail.setCategoryName(categoryName);
			}
			
			if (matchupDetail.getLanguageId() != null) {
				String languageName = matchUpDAO.getLanguageName(matchupDetail.getLanguageId()); /* 언어 이름 */
			    matchupDetail.setLanguageName(languageName);
			}
		    
			String matchTypeFirstName = matchUpDAO.getMatchTypeName(matchupDetail.getMatchTypeFirst()); 	/* 첫 번째 유형 이름 */
		    String matchTypeSecondName = matchUpDAO.getMatchTypeName(matchupDetail.getMatchTypeSecond()); /* 두 번째 유형 이름 */
		    String matchTypeThirdName = matchUpDAO.getMatchTypeName(matchupDetail.getMatchTypeThird()); 	/* 세 번째 유형 이름 */
		    
		    matchupDetail.setMatchTypeFirstName(matchTypeFirstName);
		    matchupDetail.setMatchTypeSecondName(matchTypeSecondName);
		    matchupDetail.setMatchTypeThirdName(matchTypeThirdName);
			
		}
		return matchupDetail;
	}
	
	public List<String> getDistinctRegionGroups() {
		return matchUpDAO.getDistinctRegionGroups();
	}
	
	/* 필터 목록 */
	public List<CategoryDTO> getAllCategories() {
		return matchUpDAO.getAllCategories();
	}

	public List<LanguageDTO> getAllLanguages() {
		return matchUpDAO.getAllLanguages();
	}
	
	public List<MatchTypeDTO> getAllMatchTypes() {
		return matchUpDAO.getAllMatchTypes();
	}
	
	/* 매치업 생성 */
	public int createMatchup(MatchupCreateDTO dto) {
		
		MatchUp matchupToCreate = new MatchUp();
		
		matchupToCreate.setTitle(dto.getTitle());
		matchupToCreate.setContent(dto.getContent());
		matchupToCreate.setLanguageId(dto.getLanguageId());
		matchupToCreate.setCategoryId(dto.getCategoryId());
		matchupToCreate.setCount(dto.getCount());
		matchupToCreate.setSelectedDays(dto.getSelectedDays());
		matchupToCreate.setHasMento(dto.getHasMento());
		matchupToCreate.setPrice(dto.getPrice());
		matchupToCreate.setMinMember(dto.getMinMember());
		matchupToCreate.setMaxMember(dto.getMaxMember());
		matchupToCreate.setRegionGroup(dto.getRegionGroup());
		matchupToCreate.setRegionSubgroup(dto.getRegionSubgroup());
		matchupToCreate.setRegionDetail(dto.getRegionDetail());
		matchupToCreate.setMatchTypeFirst(dto.getMatchTypeFirst());
		matchupToCreate.setMatchTypeSecond(dto.getMatchTypeSecond());
		matchupToCreate.setMatchTypeThird(dto.getMatchTypeThird());
		matchupToCreate.setLeaderId(dto.getLeaderId()); 
		matchupToCreate.setStatus(BaseStatus.ACTIVE);
		
        if (dto.getStartDay() != null && !dto.getStartDay().isEmpty() && dto.getStartTime() != null && !dto.getStartTime().isEmpty()) {
            LocalDate startDate = LocalDate.parse(dto.getStartDay());
            LocalTime startTime = LocalTime.parse(dto.getStartTime());
            matchupToCreate.setStartTime(LocalDateTime.of(startDate, startTime));
        }
        if (dto.getEndDay() != null && !dto.getEndDay().isEmpty() && dto.getEndTime() != null && !dto.getEndTime().isEmpty()) {
            LocalDate endDate = LocalDate.parse(dto.getEndDay());
            LocalTime endTime = LocalTime.parse(dto.getEndTime());
            matchupToCreate.setEndTime(LocalDateTime.of(endDate, endTime));
        }
        
	    return matchUpDAO.createMatchup(matchupToCreate);
	}

	/* 매치업 수정 */
	@Transactional
	public int updateMatchup(MatchupUpdateDTO dto) {
		
		MatchUp matchupToUpdate = matchUpDAO.getMatchupById(dto.getMatchupId());
		
        if (matchupToUpdate == null) {
            throw new RuntimeException("수정할 매치업을 찾을 수 없습니다.");
        }
		
        matchupToUpdate.setTitle(dto.getTitle());
        matchupToUpdate.setContent(dto.getContent());
        matchupToUpdate.setLanguageId(dto.getLanguageId());
        matchupToUpdate.setCategoryId(dto.getCategoryId());
        matchupToUpdate.setCount(dto.getCount());
        matchupToUpdate.setSelectedDays(dto.getSelectedDays());
        matchupToUpdate.setHasMento(dto.getHasMento());
        matchupToUpdate.setPrice(dto.getPrice());
        matchupToUpdate.setMinMember(dto.getMinMember());
        matchupToUpdate.setMaxMember(dto.getMaxMember());
        matchupToUpdate.setRegionGroup(dto.getRegionGroup());
        matchupToUpdate.setRegionSubgroup(dto.getRegionSubgroup());
        matchupToUpdate.setRegionDetail(dto.getRegionDetail());
        matchupToUpdate.setMatchTypeFirst(dto.getMatchTypeFirst());
        matchupToUpdate.setMatchTypeSecond(dto.getMatchTypeSecond());
        matchupToUpdate.setMatchTypeThird(dto.getMatchTypeThird());
		
        if (dto.getStartDay() != null && !dto.getStartDay().isEmpty() && dto.getStartTime() != null && !dto.getStartTime().isEmpty()) {
            LocalDate startDate = LocalDate.parse(dto.getStartDay());
            LocalTime startTime = LocalTime.parse(dto.getStartTime());
            matchupToUpdate.setStartTime(LocalDateTime.of(startDate, startTime));
        }
        
        if (dto.getEndDay() != null && !dto.getEndDay().isEmpty() && dto.getEndTime() != null && !dto.getEndTime().isEmpty()) {
            LocalDate endDate = LocalDate.parse(dto.getEndDay());
            LocalTime endTime = LocalTime.parse(dto.getEndTime());
            matchupToUpdate.setEndTime(LocalDateTime.of(endDate, endTime));
        }
        
	    return matchUpDAO.updateMatchup(matchupToUpdate);
	}
	
	@Transactional // 한꺼번에 처리 위해 (1. 매치업 테이블에서 해당 매치업 삭제, 2. 멤버 매치업 테이블에서 관련 내역 삭제)
	public int inactivateMatchup(int matchupId, int leaderId) {
		memberMatchUpDAO.inactivateMemberMatchupById(matchupId);

	    int result = matchUpDAO.inactivateMatchupByIdAndLeader(matchupId, leaderId);

	    return result;
	}
}