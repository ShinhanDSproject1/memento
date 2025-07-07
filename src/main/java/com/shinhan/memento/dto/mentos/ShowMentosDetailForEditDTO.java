package com.shinhan.memento.dto.mentos;

import java.time.LocalDateTime;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShowMentosDetailForEditDTO {
	private String title;
	private String simpleContent; // 간단 소개글 
	private String image;
	private int minMember;
	private int maxMember;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date startDay; // "2025-06-30"
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date endDay;
	@JsonFormat(pattern = "HH:mm")
	private LocalDateTime startTime; // "11:00" 이런식으로 받아오기
	@JsonFormat(pattern = "HH:mm")
	private LocalDateTime endTime;
	private String selectedDays;  //  "THU,WED"

	private int price;
	private int times;
	private int categoryId;
	private int languageId;

	private String regionGroup;
	private String regionSubgroup;
	private String regionDetail;

	private String content; // 소개글 

	private int matchTypeFirst;
	private int matchTypeSecond;
	private int matchTypeThird;

}
