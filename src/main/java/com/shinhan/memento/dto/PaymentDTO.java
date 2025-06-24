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
public class PaymentDTO {
	Integer payment_id;
	Integer member_id;
	Integer serial_number;
	Date pay_at;
	Integer amount;
	String pay_type;
	Integer matchup_id;
	Integer mentos_id;
	Integer keepgoing_id;
	String status;
}
