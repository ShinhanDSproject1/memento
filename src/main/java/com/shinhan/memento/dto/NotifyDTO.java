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
public class NotifyDTO {
	Integer notify_id;
	Integer member_id;
	String notify_title;
	String notify_content;
	Date notify_date;
	String status;
}
