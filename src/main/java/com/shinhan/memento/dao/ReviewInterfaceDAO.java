package com.shinhan.memento.dao;

import com.shinhan.memento.dto.ReviewSummaryDTO;

public interface ReviewInterfaceDAO {
	ReviewSummaryDTO getMentoReviewSummary(int mentoId);
}
