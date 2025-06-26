package com.shinhan.memento.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	private int memberId;
	private int matchTypeId;
	private String email;
	private String nickname;
	private String phoneNumber;
	private String userType;
	private int point;
	private String introduceMento;
	private int score;
	private String regionGroup;
	private String regionSubgroup;
	private String regionDetail;
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
}
