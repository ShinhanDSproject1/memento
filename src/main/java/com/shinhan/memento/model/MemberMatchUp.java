package com.shinhan.memento.model;

import java.sql.Date;

import com.shinhan.memento.model.BaseStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class MemberMatchUp {
	private int memberMatchupId;
	private int memberId;
	private int matchupId;
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
}
