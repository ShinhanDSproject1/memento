package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MatchupUpdateDTO {
    private Integer matchupId;
    private String title;
    private String content;
    private Integer languageId;
    private Integer categoryId;
    private Integer mentoId;
    private String startDay;
    private String endDay;
    
    private String startTime;
    private String endTime;

    private Integer count;
    private String selectedDays;
    private Boolean hasMento;
    private Integer price;
    private Integer minMember;
    private Integer maxMember;
    private String regionGroup;
    private String regionSubgroup;
    private String regionDetail;
    private Integer matchTypeFirst;
    private Integer matchTypeSecond;
    private Integer matchTypeThird;

}