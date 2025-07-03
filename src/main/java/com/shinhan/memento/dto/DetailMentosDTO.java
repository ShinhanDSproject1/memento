package com.shinhan.memento.dto;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@AllArgsConstructor
@Builder
@Getter
public class DetailMentosDTO {
	private int mentosId;
	private String title;
	private String simpleContent;
	private String image;
	private int minMember;
	private int maxMember;
	private String startDay; // "2025-06-03"
	private String endDay;
	private String startTime; // "11:00"
	private String endTime;
	private String selectedDays;

	private int price;
	private int times;
	private String categoryName; // categoryId 를 가져와서 이름 찾아서 넣기
	private String languageName; // languageId 로 조회

	private String regionGroup;
	private String regionSubgroup;
	private String regionDetail;

	private String content;

	private String matchTypeNameFirst ;
	private String matchTypeNameSecond;
	private String matchTypeNameThird;
	
	private String mentoProfile;
	private String mentoName;
	private String userType; // mento의 userType을 조회해서 String 으로 변환
	private String matchTypeName; // id로 조회하기
	private double avgScore;

	private List<SimilarMentosListDTO> similarMentosList;

	@Getter
	@Builder
	public static class SimilarMentosListDTO {
		private int mentosId;
		private String title;
		private String mentoName;
		private String startDay;
		private String endDay;
		private String startTime;
		private String endTime;
		private String selectedDay;
		private String regionSubGroup;
		private int price;
		private String image;
		private int remainSeat; // 잔여 좌석 -> maxMember를 불러오고 - 멤버_멘토스 테이블로 가서, 지금 멘토스 아이디로 몇명이 active인지 확인하고
								// 카운트해서 빼기

		private String categoryName; // categoryId 를 가져와서 이름 찾아서 넣기
		private String languageName; // languageId 로 조회
		//private String simpleContent;

		@JsonIgnore
		private Timestamp startDayRaw;
		@JsonIgnore
		private Timestamp endDayRaw;
		@JsonIgnore
		private Timestamp startTimeRaw;
		@JsonIgnore
		private Timestamp endTimeRaw;
	}

}
