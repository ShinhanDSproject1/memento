package com.shinhan.memento.dto.mypage;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MyDashboardResponseDTO {
	private List<MyJoinMatchupByDashboardResponseDTO> myCreateMatchupDashboardList;
	private List<MyJoinMatchupByDashboardResponseDTO> myMatchupDashboardList;
	private List<MyJoinMentosByDashboardResponseDTO> myMentosDashboardList;
	private MyMatchTypeByDashboardResponseDTO myMatchTypeData;
}
