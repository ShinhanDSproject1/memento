package com.shinhan.memento.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MyPageSideBarResponseDTO {
	private String profileImageUrl;
	private String nickname;
	private String userType;
	private Integer point;
	private Integer balance;
}
