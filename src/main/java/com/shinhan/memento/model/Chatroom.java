package com.shinhan.memento.model;

import java.sql.Date;

import com.shinhan.memento.model.BaseStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Chatroom {
	private int chatroomId;
	private int keepgoingId;
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
}
