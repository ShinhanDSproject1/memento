package com.shinhan.memento.dto;

import java.sql.Date;


import java.time.LocalTime;

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
		private String simpleContent;
		private String image;
		private int mentoId;
		private int minMember;
		private int maxMember;
		private Date startDay;
		private Date endDay;
		private LocalTime startTime;
		private LocalTime endTime;
		private String selectedDays;
		
		private int price;
		private int times;
		private int categoryId;
		private int languageId;
		
		private String regionGroup;
		private String regionSubgroup;
		private String regionDetail;
		
		private String content;
		
		private int matchTypeFirst;
		private int matchTypeSecond;
		private int matchTypeThird;



}
