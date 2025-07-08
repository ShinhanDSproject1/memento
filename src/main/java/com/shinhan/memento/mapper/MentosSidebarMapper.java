package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MentosSidebarMapper {
    String selectMentoName(int mentoId);
    String selectUserType(int mentoId);
    int selectStudentCount(int mentoId);
    int selectReviewCount(int mentoId);
    double selectAvgScore(int mentoId);
    String selectProfileImageUrl(int mentoId);
}
