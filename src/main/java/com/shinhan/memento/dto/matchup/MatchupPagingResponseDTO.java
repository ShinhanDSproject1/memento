package com.shinhan.memento.dto.matchup; // 실제 DTO 경로에 맞게 수정

import java.util.List;
import lombok.Getter;

@Getter
public class MatchupPagingResponseDTO<T> {
    private List<T> list;
    private MatchupPaginationResultDTO paginationResult;

    public MatchupPagingResponseDTO(List<T> list, MatchupPaginationResultDTO paginationResult) {
        this.list = list;
        this.paginationResult = paginationResult;
    }
}