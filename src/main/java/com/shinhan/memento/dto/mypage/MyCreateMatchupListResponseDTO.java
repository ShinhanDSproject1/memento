package com.shinhan.memento.dto.mypage;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class MyCreateMatchupListResponseDTO {
	private Integer matchupId;
	private String leaderImg;
	private String matchupTitle;
	private String regionGroup;
	private String regionSubgroup;
	private String category;
	private String language;
	private String startTime;
	private String endTime;
	private String selectedDays;
	private Boolean hasMento;
	private String mentoNickname;
	private Integer count;
	private Integer matchupCount;
	private String role;
	private String status;
}