package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class KeepgoingDTO {
	private String keepgoingName;
	private String location;
	private String region;
	private String selectedDays;
	private String activityStartTime;
	private String activityEndTime;
	private String studyType;
	private String detailLocation;
	private String editorTxt; // SmartEditor 내용
	private String category;
	private String language;
	private Integer price; // 숫자형이므로 Integer 사용
}
