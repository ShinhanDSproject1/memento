package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MentosDAO;
import com.shinhan.memento.dao.ReviewDAO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.ReviewSummaryDTO;

@Service
public class ReviewService {

	@Autowired
	ReviewDAO reviewDAO;

	@Autowired
	MentosDAO mentosDAO;

	public DetailMentosDTO getMentosDetail(int mentosId) {
		
		DetailMentosDTO dto = mentosDAO.selectMentosDetail(mentosId);
		ReviewSummaryDTO review = reviewDAO.getMentoReviewSummary(dto.getMentoId());
		dto.setAvgScore(review != null ? review.getAvgScore() : 0.0);
		return dto;
	}

}
