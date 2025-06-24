package com.shinhan.memento.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatMessageDTO {
	Integer chatmessage_id;
	Integer sender_id;
	Integer chatroom_id;
	String comment;
	Date created_at;
	Date updated_at;
	String status;
}
