package com.shinhan.memento.model;

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
public class MemberKeepgoing {
	private int memberKeepgoingId;
	private int memberId;
	private int keepgoingId;
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
}
