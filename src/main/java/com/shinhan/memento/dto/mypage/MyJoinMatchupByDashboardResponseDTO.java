package com.shinhan.memento.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MyJoinMatchupByDashboardResponseDTO {
	private String leaderProfileImageUrl;
	private String title;
	private String role;
	private Integer totalCount;
	private Integer currentCount;
	private String matchStatus;
	private boolean hasMento;
}