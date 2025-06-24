package com.shinhan.memento.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MemberMentosDTO {
	Integer member_mentos_id;
	Integer mentos_id;
	Integer member_id;
	Date created_at;
	Date updated_at;
	String status;
}
