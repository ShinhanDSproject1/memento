package com.shinhan.memento.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MyProfileDBUpdateDTO {
	private Integer memberId;
	private String nickname;
	private String regionGroup;
	private String phoneNumber;
	private String introduce;
	private String regionSubGroup;
	private String regionDetail;
	private String profileImageUrl;
}
