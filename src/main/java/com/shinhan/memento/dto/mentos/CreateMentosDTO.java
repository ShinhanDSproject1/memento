package com.shinhan.memento.dto.mentos;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CreateMentosDTO {
	
	private String title;
	private String simpleContent; // 간단 소개글 
	private MultipartFile image;
	private int mentoId; // 멘토스 개설하는 멤버 식별자 
	private int minMember;
	private int maxMember;
	private String startDay; // "2025-06-30"
	private String endDay;
	private String startTime; // "11:00" 이런식으로 받아오기
	private String endTime;
	private String selectedDays;  // "월,수,금"

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
