package com.shinhan.memento.dto.mentoDetail;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class MentoDetailClassDTO {
	private int mentosId; // 서버로 전송할 때 필요함
	private String mentosImg;
	private String title;
	private String mentoName;
	private String userType;
	private String startDay;
	private String endDay;
	private String startTime;
	private String endTime;
	private String selectedDays;
	private String region; // regionGroup + regionSubgroup
	private int price;
	private String createdAt;
}