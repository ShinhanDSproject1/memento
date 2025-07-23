package com.shinhan.memento.dao;

import com.shinhan.memento.model.Payment;

public interface MyPageDAOInterface {
	public int insertPayment(Payment payment);

	public Payment selectPaymentByOrderId(String orderId);

	public int updatePaymentSuccess(String orderId, int cash);

	public int updateUserBalance(int userId, int amount);
}
