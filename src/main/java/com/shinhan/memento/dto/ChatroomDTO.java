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
public class ChatroomDTO {
	Integer chatroom_id;
	Integer keepgoing_id;
	Date created_at;
	Date updated_at;
	String status;
}
