package com.shinhan.memento.dto;

import java.time.LocalDateTime;

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
	private LocalDateTime startTime;
	private LocalDateTime endTime;
	private String location; //마포구
	private int totalCnt;
}
