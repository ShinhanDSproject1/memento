package com.shinhan.memento.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MyPageDAO;
import com.shinhan.memento.dto.ValidateCashRequestDTO;
import com.shinhan.memento.dto.ValidateCashResponseDTO;
import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.CashProduct;
import com.shinhan.memento.model.PayType;
import com.shinhan.memento.model.Payment;
import com.shinhan.memento.model.Payment_Step;

@Service
public class MyPageService {

		@Autowired
		MyPageDAO myPageDAO;
		
		public ValidateCashResponseDTO validateCash(ValidateCashRequestDTO reqDTO,int userId) {
			
			CashProduct product = myPageDAO.validateCash(reqDTO.getCashProductID());
			String orderId = UUID.randomUUID().toString();

		    Payment payment = Payment.builder()
		        .memberId(userId)
		        .orderId(orderId)
		        .amount(product.getAmount())
		        .step(Payment_Step.WAIT)
		        .payType(PayType.CHARGE)
		        .status(BaseStatus.ACTIVE)
		        .build();

			myPageDAO.insertWaitPayment(payment);
			
			return ValidateCashResponseDTO.builder() 
		            .cashProduct(product.name())
		            .amount(product.getAmount())
		            .orderName(product.getOrderName())
		            .bonus(product.getBonus())
		            .build();
		}
}
