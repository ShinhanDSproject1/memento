package com.shinhan.memento.service;

import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dto.mentoDetail.MentoDetailReviewDTO;
import com.shinhan.memento.mapper.MemberMapper;
import com.shinhan.memento.mapper.MentosMapper;
import com.shinhan.memento.mapper.ReviewMapper;
import com.shinhan.memento.model.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewService {

	@Autowired
	ReviewMapper reviewMapper;

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	MentosMapper mentosMapper;

	/**
	 * 멘토 상세 페이지 (리뷰조회하기)
	 */
	public List<MentoDetailReviewDTO> showMentoReviews(int mentoId, Date lastCreatedAt) {
		log.info("[ReviewService.showMentoReviews]");
		// 해당하는 mento 의 아이디로 존재하는 모든 리뷰 가져오기
		Map<String, Object> reviewParams = new HashMap<>();
		reviewParams.put("mentoId", mentoId);
		reviewParams.put("lastCreatedAt", lastCreatedAt);
		List<Review> reviewList = reviewMapper.getReviewsByMentoIdAfter(reviewParams);
		
		List<MentoDetailReviewDTO> result = new ArrayList<>();
		String reviewImg;
		double score;
		String reviewerName;
		String createdAt;
		String title;
		String reviewComment;

		for (Review review : reviewList) {
			reviewImg = review.getReviewImg();
			score = review.getScore();
			reviewerName = memberMapper.findMemberById(review.getMentiId()).getNickname();
			createdAt = review.getCreatedAt().toString();
			title = mentosMapper.checkValidMentosById(review.getMentosId()).getTitle();
			reviewComment = review.getReviewComment();

			MentoDetailReviewDTO dto = MentoDetailReviewDTO.builder().reviewImg(reviewImg).score(score)
					.reviewerName(reviewerName).createdAt(createdAt).title(title).reviewComment(reviewComment).build();

			result.add(dto);
		}

		return result;
	}
}