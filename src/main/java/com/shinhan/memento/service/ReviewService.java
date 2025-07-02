package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dto.ReviewSummaryDTO;
import com.shinhan.memento.mapper.ReviewMapper;

@Service
public class ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    public ReviewSummaryDTO getReviewSummary(int mentosId) {
        return reviewMapper.calculateAvgReviews(mentosId);
    }
}
