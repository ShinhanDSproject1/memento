package com.shinhan.memento.dto.mentos;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@AllArgsConstructor
@Builder
public class CreateMentosDBDTO {

	private String title;
	private String simpleContent; // 간단 소개글 
	private String image;
	private int mentoId; // 멘토스 개설하는 멤버 식별자 
	private int minMember;
	private int maxMember;
	private Date startDay; // "2025-06-30"
	private Date endDay;
	private Timestamp startTime; // "11:00" 이런식으로 받아오기
	private Timestamp endTime;
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
