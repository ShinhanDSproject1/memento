package com.shinhan.memento.dto;

import java.util.List;

import lombok.Data;

@Data
public class MentorDetailDTO {
    private int mentorId;
    private String nickname;
    private String profileImageUrl;
    private String introduce;         // 한 줄 소개
    private String introduceMentor;   // 멘토 자기소개
    private double averageScore;
    private int reviewCount;
    private int studentCount;
    private List<String> languages;   // 언어 리스트
    private List<MentoringHistoryDTO> mentoringHistory;
    private List<ReviewDTO> reviews;
}
