package com.shinhan.memento.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MyJoinMentosByDashboardResponseDTO {
	private String mentosTitle;
	private String mentosImage;
	private String mentoNickname;
	private String mentosStatus;
}
