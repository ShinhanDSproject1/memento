package com.shinhan.memento.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
public class MyMentosListResponseDTO {
	private Integer mentosId;
	private String mentosImg;
	private String mentosTitle;
	private String regionGroup;
	private String regionSubgroup;
	private String startTime;
	private String endTime;
	private String selectedDays;
	private String mentoNickname;
	private String mentoUserType;
	private String status;
	private Integer reviewId;
	private String reviewStatus;
}