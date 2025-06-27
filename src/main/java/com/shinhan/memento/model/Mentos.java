package com.shinhan.memento.model;

import java.sql.Date;
import java.time.LocalDateTime;

import com.shinhan.memento.model.BaseStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class Mentos {
	private int mentosId;
	private int categoryId;
	private int languageId;
	private int mentoId;
	private String title;
	private String simpleContent;
	private String image;
	private int price;
	private String regionGroup;
	private String regionSubgroup;
	private String regionDetail;
	private Date startDay;
	private Date endDay;
	private LocalDateTime startTime;
	private LocalDateTime endTime;
	private String selectedDays;
	private int times; //멘토링 횟수 
	private int minMember;
	private int maxMember;
	private String content; //강의소개 
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
	private int matchTypeIdFirst;
	private int matchTypeIdSecond;
	private int matchTypeIdThird;
}
