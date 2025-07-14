package com.shinhan.memento.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ConfirmCashResponseDTO {

	private String orderId;     
    private int amount;           
    private String status;        
    private String message;        // 사용자 안내 메시지
    private String payAt;          // 결제 완료 일시(YYYY-MM-DD HH:mm:ss)
    private int cash;
}
