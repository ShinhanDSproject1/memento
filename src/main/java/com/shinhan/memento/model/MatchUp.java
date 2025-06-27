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
public class MatchUp {
	private int matchupId;
	private int categoryId;
	private int languageId;
	private int leaderId;
	private int mentoId;
	private int matchTypeIdFirst;
	private int matchTypeIdSecond;
	private int matchTypeIdThird;
	private String title;
	private int count; // 전체 횟수 
	private int matchupCount; //실제 이행 횟수 
	private Date startDay;
	private Date endDay;
	private LocalDateTime startTime;
	private LocalDateTime endTime;
	private int minMember;
	private int maxMember;
	private String content; //매치업 소개내용 
	private boolean hasMento;
	private int price;
	private int kgCount; //킵고잉 찬성수 
	private String regionGroup;
	private String regionSubgroup;
	private String regionDetail;
	private String selectedDays; // 활동요일 
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
}
