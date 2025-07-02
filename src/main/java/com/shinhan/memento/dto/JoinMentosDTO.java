package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;

import lombok.Getter;

@Getter
@AllArgsConstructor
public class JoinMentosDTO {

	private int mentosId;
	private int memberId; // 참여하는 멤버 아이디
}
