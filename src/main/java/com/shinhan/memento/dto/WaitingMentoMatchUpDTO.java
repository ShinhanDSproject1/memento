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
public class WaitingMentoMatchUpDTO {
	Integer wait_mento_id;
	Integer member_id;
	Integer matchup_id;
	Date created_at;
	String status;
}
