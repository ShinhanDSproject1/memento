package com.shinhan.memento.dto;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Builder
@Getter
@Setter
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

	private String matchTypeIdFirst; // id값으로 조회해서 이름가져오기
	private String matchTypeIdSecond;
	private String matchTypeIdThird;

	private int mentoId;
	private String mentoProfile; // 지피티한테 "디비에 넣을때 이미지를 multipartfile로 받아서 그 경로를 디비에 저장해두는데, 디비에서 그냥 그 경로를
									// string으로 가져오기만해도 알아서 이미지를 보여주는건가??"라고 물어보면서 무슨 타입으로 받아와야하는지 알아봐
	private String mentoName;
	private String userType; // mento의 userType을 조회해서 String 으로 변환
	private String matchTypeName; // id로 조회하기
	private double avgScore;

	private List<SimilarMentosListDTO> similarMentosList;

	@Getter
	@Setter
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
		private String simpleContent;
		
		
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
