package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PopularMentorDTO {
    private String nickname;
    private String profileImage;
    private Double score;  // 이 score는 avg_score의 평균값
    private int memberId;
}