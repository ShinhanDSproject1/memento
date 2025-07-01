package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@AllArgsConstructor
@Builder
@Getter
public class MatchTypeDTO {
    private int matchTypeId;
    private String matchTypeName;
}