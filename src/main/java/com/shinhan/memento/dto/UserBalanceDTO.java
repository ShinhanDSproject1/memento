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
public class UserBalanceDTO {
	Integer userbalance_id;
	Integer member_id;
	Integer balance;
	Date updated_at;
	String status;
}
