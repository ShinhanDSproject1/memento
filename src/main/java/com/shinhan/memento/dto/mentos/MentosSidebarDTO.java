package com.shinhan.memento.dto.mentos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MentosSidebarDTO {
    private String mentoName;
    private String userType;
    private String studentCount; // 학생 수
    private String reviewCount;  // 리뷰 수
    private double avgScore;
    private String profileImageUrl;
}

