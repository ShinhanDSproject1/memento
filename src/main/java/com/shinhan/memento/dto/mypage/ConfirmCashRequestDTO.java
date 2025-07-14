package com.shinhan.memento.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ConfirmCashRequestDTO {

	private String paymentType;
    private String paymentKey;
    private String orderId;    
    private int amount;        
}
