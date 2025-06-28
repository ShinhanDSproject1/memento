package com.shinhan.memento.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class MemberInterest {
	private int memberInterestId;
	private int memberId;
	private int interestId;
}
