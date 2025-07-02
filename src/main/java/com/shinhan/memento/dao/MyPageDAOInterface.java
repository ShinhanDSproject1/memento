package com.shinhan.memento.dao;

import java.util.List;

import com.shinhan.memento.dto.MyMatchupListResponseDTO;
import com.shinhan.memento.dto.MyMentosListResponseDTO;
import com.shinhan.memento.model.Payment;

public interface MyPageDAOInterface {

	public abstract List<MyMentosListResponseDTO> selectMyMentosListById(Integer memberId);

	public int insertPayment(Payment payment);

	public Payment selectPaymentByOrderId(String orderId);

	public int updatePaymentSuccess(String orderId, int cash);

	public int updateUserBalance(int userId, int amount);

	public List<MyMatchupListResponseDTO> selectJoinListByMemberId(Integer memberId);
}
