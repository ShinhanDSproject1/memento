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
public class MemberMatchUpDTO {
	Integer member_matchup_id;
	Integer member_id;
	Integer matchup_id;
	Date created_at;
	Date updated_at;
	String status;
}
