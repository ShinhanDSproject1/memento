package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Builder
public class JoinKeepgoingDTO {
	private Integer keepgoingId;
	private Integer memberId;
}
