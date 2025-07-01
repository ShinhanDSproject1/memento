package com.shinhan.memento.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ValidateCashResponseDTO {
	private String orderId;
    private int amount;         
    private String orderName; 
    private int bonus;          
    private int cash;
}
