package com.shinhan.memento.dao;

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
	
	public CashProduct validateCash(int productId) {
		return CashProduct.fromId(productId);
	}

	public void waitPaymentCash() {
		
	}

	@Override
	public void insertWaitPayment(Payment payment) {
		log.info("[MyPageDAO.insertPayment]");
		return null;
	}
	
}
