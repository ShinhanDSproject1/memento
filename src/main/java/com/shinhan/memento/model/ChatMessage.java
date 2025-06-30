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
public class ChatMessage {
	private int chatmessageId;
	private int senderId;
	private int chatroomId;
	private String chatComment;
	private Date createdAt;
	private Date updatedAt;
	private BaseStatus status;
}
