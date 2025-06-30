package com.shinhan.memento.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shinhan.memento.dao.MatchUpDAO;
import com.shinhan.memento.dao.MemberMatchUpDAO;
import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchupDetailDTO;
import com.shinhan.memento.dto.MatchupListDTO;
import com.shinhan.memento.dto.MemberDTO;
import com.shinhan.memento.model.MatchUp;

@Service
public class MatchupService {

    @Autowired
    MatchUpDAO matchUpDAO;

    @Autowired
    MemberMatchUpDAO memberMatchUpDAO;

    public List<MatchupListDTO> getMatchupList(Map<String, Object> filters, int memberId) {
        List<MatchupListDTO> matchups = matchUpDAO.getMatchupList(filters);

        if (matchups == null) {
            throw new IllegalStateException("matchUpDAO.getMatchupList() 반환값이 null");
        }

        for (MatchupListDTO matchup : matchups) {
            if (matchup == null || matchup.getMatchupId() == null) {
                continue;
            }

            int currentMemberCount = matchUpDAO.getActiveMemberCount(matchup.getMatchupId());
            matchup.setCount(currentMemberCount);

            String categoryName = matchUpDAO.getCategoryName(matchup.getCategoryId());
            matchup.setCategoryName(categoryName);

            String languageName = matchUpDAO.getLanguageName(matchup.getLanguageId());
            matchup.setLanguageName(languageName);

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
        }

        if (matchupDetail.getMatchupId() != null) {
            int currentMemberCount = matchUpDAO.getActiveMemberCount(matchupDetail.getMatchupId());
            matchupDetail.setCount(currentMemberCount);
        }

        if (matchupDetail.getCategoryId() != null) {
            String categoryName = matchUpDAO.getCategoryName(matchupDetail.getCategoryId());
            matchupDetail.setCategoryName(categoryName);
        }

        if (matchupDetail.getLanguageId() != null) {
            String languageName = matchUpDAO.getLanguageName(matchupDetail.getLanguageId());
            matchupDetail.setLanguageName(languageName);
        }

        String matchTypeFirstName = null;
        if (matchupDetail.getMatchTypeFirst() != null) {
            matchTypeFirstName = matchUpDAO.getMatchTypeName(matchupDetail.getMatchTypeFirst());
        }

        String matchTypeSecondName = null;
        if (matchupDetail.getMatchTypeSecond() != null) {
            matchTypeSecondName = matchUpDAO.getMatchTypeName(matchupDetail.getMatchTypeSecond());
        }

        String matchTypeThirdName = null;
        if (matchupDetail.getMatchTypeThird() != null) {
            matchTypeThirdName = matchUpDAO.getMatchTypeName(matchupDetail.getMatchTypeThird());
        }

        matchupDetail.setMatchTypeFirstName(matchTypeFirstName);
        matchupDetail.setMatchTypeSecondName(matchTypeSecondName);
        matchupDetail.setMatchTypeThirdName(matchTypeThirdName);

        return matchupDetail;
    }

    public List<String> getDistinctRegionGroups() {
        return matchUpDAO.getDistinctRegionGroups();
    }

    public List<CategoryDTO> getAllCategories() {
        return matchUpDAO.getAllCategories();
    }

    public List<LanguageDTO> getAllLanguages() {
        return matchUpDAO.getAllLanguages();
    }

    public int createMatchup(MatchUp matchup) {
        return matchUpDAO.createMatchup(matchup);
    }

    @Transactional
    public int inactivateMatchup(int matchupId, int leaderId) {
        memberMatchUpDAO.inactivateMemberMatchupById(matchupId);
        return matchUpDAO.inactivateMatchupByIdAndLeader(matchupId, leaderId);
    }

    public boolean applyMatchup(int memberId, int matchupId) {
        int exists = memberMatchUpDAO.existsActiveApplication(memberId, matchupId);
        if (exists > 0) {
            return false;
        }
        memberMatchUpDAO.insertApplication(memberId, matchupId);
        return true;
    }

    @Transactional
    public boolean cancelApplication(int memberId, int matchupId) {
        int affected = memberMatchUpDAO.updateStatusToInactive(memberId, matchupId);
        System.out.println("취소 처리된 행 수: " + affected);  // 로그 추가
        return affected > 0;
    }
    public boolean isApplied(int memberId, int matchupId) {
        int count = memberMatchUpDAO.existsActiveApplication(memberId, matchupId);
        return count > 0;
    }
    
    @Transactional
    public int applyMatchupAndGetCount(int memberId, int matchupId) {
        int exists = memberMatchUpDAO.existsActiveApplication(memberId, matchupId);
        if (exists > 0) {
            return -1; // 이미 신청됨
        }
        memberMatchUpDAO.insertApplication(memberId, matchupId);
        return matchUpDAO.getActiveMemberCount(matchupId);
    }
    
    @Transactional
    public int cancelApplicationAndGetCount(int memberId, int matchupId) {
        int affected = memberMatchUpDAO.updateStatusToInactive(memberId, matchupId);
        if (affected == 0) {
            return -1;
        }
        return matchUpDAO.getActiveMemberCount(matchupId);
    }
    public MatchupDetailDTO getMatchupDetailWithLeaderCheck(int matchupId, int memberId) {
        MatchupDetailDTO detail = getMatchupDetail(matchupId);
        if (detail == null) {
            throw new IllegalArgumentException("매치업을 찾을 수 없습니다. id: " + matchupId);
        }

        boolean isLeader = detail.getLeaderId() != null && detail.getLeaderId().equals(memberId);
        detail.setLeader(isLeader);

        return detail;
    }
    
    public List<MemberDTO> getTeamMembersByMatchupId(int matchupId) {
        return memberMatchUpDAO.findMembersByMatchupId(matchupId);
    }

}

