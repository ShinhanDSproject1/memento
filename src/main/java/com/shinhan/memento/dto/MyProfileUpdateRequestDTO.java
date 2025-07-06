package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@AllArgsConstructor
@ToString
public class MyProfileUpdateRequestDTO {
	private String nickname;
	private String interestNames;
	private String address;
	private String phone;
	private String introduction;
	private String originalProfileUrl;
}