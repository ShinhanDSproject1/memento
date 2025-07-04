package com.shinhan.memento.dto.mentos;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@AllArgsConstructor
@Builder
@Getter
public class GetMentosDetailDTO {
	private int mentosId;
	private String title;
	private String simpleContent;
	private String image;
	private int currentMemberCnt; // 현재 참여중인 인원 
	private int maxMember;
	private String startDay; // "2025-06-03"
	private String endDay;
	private String startTime; // "11:00"
	private String endTime;
	private String selectedDays;

	private int price;
	private String times; // 2회 이런식으로 줘버리기 
	private String categoryName;
	private String languageName;

	private String place; // regionGroup + regionSubgroup + regionDetail

	private String content; //소개글 

	private String matchTypeNameFirst;
	private String matchTypeNameSecond;
	private String matchTypeNameThird;

	private String mentoProfile;
	private String mentoName;
	private String userType; 
	private String matchTypeName; 
	private double avgScore;
	
	@JsonIgnore
	public boolean isFavorite() {
	    return this.isFavorite;
	}

	@JsonProperty("isFavorite")
	private boolean isFavorite; //찜했는지 안했는지 


	private List<GetSimilarMentosListDTO> similarMentosList;

	@Getter
	@Builder
	@AllArgsConstructor
	public static class GetSimilarMentosListDTO {
		private int mentosId;
		private String title;
		private String mentoName;
		private String userType;
		private String startDay;
		private String endDay;
		private String startTime;
		private String endTime;
		private String selectedDay;
		private String regionSubGroup;
		private int price;
		private String image;
		private String remainSeat;

		private String categoryName;
		private String languageName;
		private String simpleContent; // hover 했을 때 보이는 값 
	}

}
