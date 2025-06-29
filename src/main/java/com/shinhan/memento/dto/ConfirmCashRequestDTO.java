package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class ConfirmCashRequestDTO {

    private String paymentKey; // 토스가 결제 요청시 부여하는 결제 고유키
    private String orderId;    // 주문ID (결제 시작 시 생성해서 Toss에 넘겼던 그 값)
    private int amount;        // 결제금액(검증 목적. 서버DB와 일치해야 승인)
}
