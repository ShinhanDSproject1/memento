package com.shinhan.memento.model;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
public class Keepgoing {
	private int keepgoingId;
	private int memberId;
	private int categoryId;
	private int languageId;
	private int matchTypeId;
	private String name;
	private String imgLogo;
	private String imgActivity;
	private LocalDateTime startTime;
	private LocalDateTime emdTime;
	private String selectedDays;
	private String content;
	private int price;
	private String regionGroup;
	private String regionSubgroup;
	private String regionDetail;
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
}
