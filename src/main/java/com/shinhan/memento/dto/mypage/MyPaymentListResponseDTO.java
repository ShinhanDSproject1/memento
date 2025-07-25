package com.shinhan.memento.dto.mypage;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class MyPaymentListResponseDTO {
	private String orderId;
	private Integer amount;
	private String payType;
	private Integer matchupId;
	private Integer mentosId;
	private Integer keepgoingId;
	private String paymentStatus;
	private String matchupTitle;
	private String mentosTitle;
	private String keepgoingName;
}