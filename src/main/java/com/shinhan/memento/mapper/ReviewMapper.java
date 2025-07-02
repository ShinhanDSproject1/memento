package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.shinhan.memento.dto.ReviewSummaryDTO;

@Mapper
public interface ReviewMapper {
	ReviewSummaryDTO calculateAvgReviews(int mentosId);
}
