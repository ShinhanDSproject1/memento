package com.shinhan.memento.dto;

import java.sql.Date;

import com.shinhan.memento.model.BaseStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MatchupApplyMentoDTO {
	private int waitMentoId;
	private int memberId;
	private int matchupId;
	private Date createdAt;
	private BaseStatus status;
}