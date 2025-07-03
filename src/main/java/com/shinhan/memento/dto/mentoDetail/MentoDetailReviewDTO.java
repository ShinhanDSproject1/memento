package com.shinhan.memento.dto.mentoDetail;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@AllArgsConstructor
@Builder
public class MentoDetailReviewDTO {
	
	private String reviewImg;
	private double score;
	private String reviewerName; //리뷰 쓰는 사람 이름 -> menti_id 이용
	private String createdAt; //작성일
	private String title; // mentos_id 로 title 가져오기
	private String reviewComment; //리뷰내용
}
