package com.shinhan.memento.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MyMatchupListResponseDTO {
	private Integer matchupId;
	private String leaderImg;
	private String matchupTitle;
	private String regionSubgroup;
	private String category;
	private String language;
	private Timestamp startTime;
	private Timestamp endTime;
	private String selectedDays;
	private Boolean hasMento;
	private String mentoNickname;
	private Integer count;
	private Integer matchupCount;
	private String role;
	private String status;
}