package com.shinhan.memento.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PopularMentiDTO {
    private int memberId;
    private String nickname;
    private String profileImage;
    private double score;
}
