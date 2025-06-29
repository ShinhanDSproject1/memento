package com.shinhan.memento.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CashProduct {
	
    FIVE_THOUSAND(1, 5000, "me캐시 5,000원 충전", 250),
    TEN_THOUSAND(2, 10000, "me캐시 10,000원 충전", 500),
    THIRTY_THOUSAND(3, 30000, "me캐시 30,000원 충전", 1500),
    FIFTY_THOUSAND(4, 50000, "me캐시 50,000원 충전", 5000),
    HUNDRED_THOUSAND(5, 100000, "me캐시 100,000원 충전", 10000);

    private final int id;
    private final int amount;
    private final String orderName;
    private final int bonus;

    public static CashProduct fromId(int id) {
        for (CashProduct cash : CashProduct.values()) {
            if (cash.getId() == id) return cash;
        }
        throw new IllegalArgumentException("유효하지 않은 캐시 상품 ID: " + id);
    }
}