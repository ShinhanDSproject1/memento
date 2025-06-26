package com.shinhan.memento.dto.mentos;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class MentosItemDTO {
    private String title;
    private String name;
    private String startDate;
    private String endDate;
    private Integer startTime;
    private Integer endTime;
    private List<String> seletedDate;
    private String location;
    private Integer price;
    private Integer decisionCount;
}
