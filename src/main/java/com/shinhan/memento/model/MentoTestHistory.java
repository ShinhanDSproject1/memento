package com.shinhan.memento.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class MentoTestHistory {
	private int mentotestHistoryId;
	private int memberId;
	private Date testAt;
	private BaseStatus status;
}
