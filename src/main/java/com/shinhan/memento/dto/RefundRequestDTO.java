package com.shinhan.memento.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class RefundRequestDTO {
	private String orderId;
	private Integer amount;
	private String payType;
	private Integer matchupId;
	private Integer matchupPrice;
	private Integer mentosId;
	private Integer mentosPrice;
	private Integer keepgoingId;
	private Integer keepgoingPrice;
	private Integer userBalance;
	private Integer memberPoint;
}