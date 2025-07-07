package com.shinhan.memento.dto;

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
	private List<MyJoinMatchupByDashboardResponseDTO> myMatchupDashboardList;
	private List<MyJoinMentosByDashboardResponseDTO> myMentosDashboardList;
	private MyMatchTypeByDashboardResponseDTO myMatchTypeData;
}
