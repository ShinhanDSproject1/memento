package com.shinhan.memento.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.model.CashProduct;
import com.shinhan.memento.model.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MyPageDAO implements MyPageDAOInterface{
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.shinhan.memento.dao.MyPageDAOInterface.";
	
	public CashProduct validateCash(int productId) {
		return CashProduct.fromId(productId);
	}

	@Override
	public int insertPayment(Payment payment) {
		log.info("[MyPageDAO.insertPayment]");
		return sqlSession.insert(namespace + "insertPayment", payment);
	}

	@Override
	public Payment selectPaymentByOrderId(String orderId) {
		log.info("[MyPageDAO.selectPaymentByOrderId]");
		return sqlSession.selectOne(namespace + "selectPaymentByOrderId", orderId);
	}

	@Override
	public int updatePaymentSuccess(String orderId, int cash) {
		log.info("[MyPageDAO.updatePaymentSuccess]");
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("orderId", orderId);
	    paramMap.put("cash", cash);
	    paramMap.put("payAt", new java.sql.Date(System.currentTimeMillis()));
		return sqlSession.update(namespace + "updatePaymentSuccess", paramMap);
	}

	@Override
	public int updateUserBalance(int userId, int amount) {
		log.info("[MyPageDAO.updateUserBalance]");
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userId);
	    paramMap.put("amount", amount);
	    paramMap.put("updatedAt", new java.sql.Date(System.currentTimeMillis()));
		return sqlSession.update(namespace + "updateUserBalance", paramMap);
	}
	
}
