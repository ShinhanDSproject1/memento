package com.shinhan.memento.model;

import java.sql.Date;

import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.PayType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payment {
	private int paymentId;
	private int memberId;
	private int serialNumber;
	private Date payAt;
	private int amount;
	private PayType payType;
	private int matchupId;
	private int mentosId;
	private int keepgoingId;
	private BaseStatus status;
}
