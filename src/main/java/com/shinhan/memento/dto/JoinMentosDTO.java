package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class JoinMentosDTO {

	private int mentosId;
	private int memberId; // 참여하는 멤버 아이디
}
