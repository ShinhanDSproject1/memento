package com.shinhan.memento.dao;

import com.shinhan.memento.model.Payment;
import java.util.List;
import com.shinhan.memento.dto.MyMentosListResponseDTO;

public interface MyPageDAOInterface {

	public abstract List<MyMentosListResponseDTO> selectMyMentosListById(Integer memberId);
  public int insertPayment(Payment payment);
	public Payment selectPaymentByOrderId(String orderId);
	public int updatePaymentSuccess(String orderId, int cash);
	public int updateUserBalance(int userId, int amount);

}
