package com.shinhan.memento.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class PaymentDetailResponseDTO {
	private String orderId;
	private Integer amount;
	private Integer matchupId;
	private String matchupTitle;
	private Integer matchupPrice;
	private Integer matchupCount;
	private String memberProfileImageUrl;
	private Integer mentosId;
	private String mentosTitle;
	private String mentosImage;
	private String mentosStartDay;
	private Integer mentosPrice;
	private Integer keepgoingId;
	private String keepgoingName;
	private String keepgoingImgLogo;
	private Integer keepgoingPrice;
	private String payAt;
	private String payType;
	private String status;
}
