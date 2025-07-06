package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
@AllArgsConstructor
public class MyProfileInfoResponseDTO {
	private String profileImgUrl;
	private String nickName;
	private String introduce;
	private String location;
	private String phoneNumber;
	private String interestName;
}
