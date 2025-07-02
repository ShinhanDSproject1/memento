package com.shinhan.memento.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shinhan.memento.dto.*;
import com.shinhan.memento.model.MatchUp;
import com.shinhan.memento.model.UserType;

@Mapper
public interface MatchupMapper {

    List<MatchupListDTO> getMatchupList(Map<String, Object> params);

    int countAll(Map<String, Object> params);

    List<String> getDistinctRegionGroups();

    List<CategoryDTO> getAllCategories();

    List<LanguageDTO> getAllLanguages();

    List<MatchTypeDTO> getAllMatchTypes();

    int getActiveMemberCount(int matchupId);

    String getCategoryName(int categoryId);

    String getMatchTypeName(int typeId);

    String getLanguageName(int languageId);

    MatchupDetailDTO getMatchupDetail(int matchupId);

    int createMatchup(MatchUp matchup);

    MatchUp getMatchupById(Integer matchupId);

    int updateMatchup(MatchUp matchup);

    int inactivateMatchupByIdAndLeader(@Param("matchupId") int matchupId, @Param("leaderId") int leaderId);

    int applyMento(MatchupApplyMentoDTO dto);

    UserType findUserTypeById(int memberId);

    int checkMentoApplicationExists(Map<String, Object> params);

    List<MatchupWaitingMentoDTO> selectWaitingMentoByMatchupId(int matchupId);

    int setMentoForMatchup(Map<String, Object> params);

    int deleteWaitingMentoApplications(int matchupId);

    MatchupWaitingMentoDTO getApprovedMentoDetails(int memberId);

    int incrementMatchupCount(int matchupId);
}