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
public class Notify {
	private int notifyId;
	private int memberId;
	private String notifyTitle;
	private String notifyContent;
	private Date notifyDate;
	private BaseStatus status;
}
