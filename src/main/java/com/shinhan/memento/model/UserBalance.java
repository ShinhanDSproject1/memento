package com.shinhan.memento.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserBalance {
	private int userbalanceId;
	private int memberId;
	private int balance;
	private Date updatedAt;
	private String status;
}
