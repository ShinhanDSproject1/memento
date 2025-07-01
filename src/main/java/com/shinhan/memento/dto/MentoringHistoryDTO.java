package com.shinhan.memento.dto;

import java.util.List;

import lombok.Data;

@Data
public class MentoringHistoryDTO {
    private String title;
    private String startDate;
    private String endDate;
    private String location;
    private String price;
}
