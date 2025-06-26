package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class MypageKeepgoingHistoryDTO {
	private int keepgoingId;
	private String logo;
	private String name;
	private String selectedDays;
	private String startTime;
	private String endTime;
	private String location; //마포구
	private int totalCnt;
}
