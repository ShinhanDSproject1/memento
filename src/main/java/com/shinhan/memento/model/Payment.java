package com.shinhan.memento.model;

import java.sql.Date;

import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.PayType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Payment {
	private int paymentId;
	private int memberId;
	private String orderId;
	private Date payAt;
	private int amount;
	private PayType payType;
    private Payment_Step step;
	private int matchupId;
	private int mentosId;
	private int keepgoingId;
	private BaseStatus status;
}
