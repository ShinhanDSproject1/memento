package com.shinhan.memento.mapper;

import java.util.List;
import java.util.Map;

import com.shinhan.memento.dto.matchup.MatchupListDTO;

public interface MatchupSimilarMapper {
    List<MatchupListDTO> findSimilarMatchups(Map<String, Object> param);
}