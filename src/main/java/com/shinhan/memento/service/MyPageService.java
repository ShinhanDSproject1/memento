package com.shinhan.memento.service;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.swing.ListModel;

import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.shinhan.memento.common.exception.MypageException;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dao.MyPageDAO;
import com.shinhan.memento.dto.ConfirmCashRequestDTO;
import com.shinhan.memento.dto.ConfirmCashResponseDTO;
import com.shinhan.memento.dto.MyMatchupListResponseDTO;
import com.shinhan.memento.dto.MyMentosListResponseDTO;
import com.shinhan.memento.dto.MyPaymentListResponseDTO;
import com.shinhan.memento.dto.MyProfileInfoResponseDTO;
import com.shinhan.memento.dto.SparkTestResultRequestDTO;
import com.shinhan.memento.dto.SparkTestResultResponseDTO;
import com.shinhan.memento.dto.ValidateCashRequestDTO;
import com.shinhan.memento.dto.ValidateCashResponseDTO;
import com.shinhan.memento.mapper.MypageMapper;
import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.CashProduct;
import com.shinhan.memento.model.PayType;
import com.shinhan.memento.model.Payment;
import com.shinhan.memento.model.Payment_Step;
import com.shinhan.memento.model.SparkTestType;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageService {

	@Autowired
	MyPageDAO myPageDAO;

	@Autowired
	MypageMapper mypageMapper;
	
	public ValidateCashResponseDTO validateCash(ValidateCashRequestDTO reqDTO, int userId) {
		CashProduct product = myPageDAO.validateCash(reqDTO.getCashProductID());
		String orderId = UUID.randomUUID().toString();
		System.out.println(orderId);
		Payment payment = Payment.builder()
				.memberId(userId)
				.orderId(orderId)
				.amount(product.getAmount())
				.step(Payment_Step.WAIT)
				.payType(PayType.CHARGE)
				.status(BaseStatus.ACTIVE)
				.build();

		int result = myPageDAO.insertPayment(payment);
		if (result != 1)
			throw new MypageException(BaseExceptionResponseStatus.FAILURE);

		return ValidateCashResponseDTO.builder()
				.orderId(orderId)
				.amount(product.getAmount())
				.orderName(product.getOrderName())
				.bonus(product.getBonus())
				.cash(product.getCash())
				.build();
	}

	public ConfirmCashResponseDTO confirmCash(ConfirmCashRequestDTO reqDTO, int userId) {

		
		// 1) DB에서 orderId로 결제건 조회 (임시건)
		Payment payment = myPageDAO.selectPaymentByOrderId(reqDTO.getOrderId());
		log.info("[payment]" +payment.getOrderId());
		
		if (payment == null || payment.getMemberId() != userId) {
			throw new MypageException(BaseExceptionResponseStatus.CANNOT_FOUND_MEMBER, "유효하지 않은 주문번호");
		}
		// 2) 결제금액 일치 검증
		if (payment.getAmount() != reqDTO.getAmount()) {
			throw new MypageException(BaseExceptionResponseStatus.FAILURE, "결제금액 불일치");
		}

		// 3) (필요시) Toss 결제 승인 API 호출 (여기서 외부 API 호출)
		// - 예시로, 외부 호출 코드만 구조적으로 삽입
		boolean tossSuccess = callTossPaymentsConfirmApi(reqDTO);
		if (!tossSuccess)
			throw new MypageException(BaseExceptionResponseStatus.FAILURE, "토스 결제 승인 실패");

		// 4) 결제 상태 'SUCCESS'로 변경
		CashProduct cash = CashProduct.fromAmount(payment.getAmount());
		int updatePaymentSuccess = myPageDAO.updatePaymentSuccess(payment.getOrderId(), cash.getCash());
		if (updatePaymentSuccess != 1)
			throw new MypageException(BaseExceptionResponseStatus.FAILURE, "DB 상태 변경 실패");

		// 5) 잔액 상태 업데이트
		int updateUserBalance = myPageDAO.updateUserBalance(userId, cash.getCash());
		if (updateUserBalance != 1)
			throw new MypageException(BaseExceptionResponseStatus.FAILURE, "잔액 변경 실패");
				
		// 6) 응답 DTO 구성
		return ConfirmCashResponseDTO.builder()
				.orderId(payment.getOrderId())
				.amount(payment.getAmount())
				.cash(cash.getCash())
				.status("SUCCESS")
				.message("결제가 성공적으로 완료되었습니다")
				.build();
	}

	/* 실제 Toss API 호출 */
	private boolean callTossPaymentsConfirmApi(ConfirmCashRequestDTO reqDTO) {
		try {
			String tossSecretKey = "test_gsk_docs_OaPz8L5KdmQXkzRz3y47BMw6"; // 너의 시크릿키로 변경
			String apiUrl = "https://api.tosspayments.com/v1/payments/confirm";

			// 1. HTTP Basic Auth 헤더 만들기
			String encodedAuth = Base64.getEncoder()
					.encodeToString((tossSecretKey + ":").getBytes(StandardCharsets.UTF_8));
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			headers.set("Authorization", "Basic " + encodedAuth);

			// 2. 요청 바디 만들기
			Map<String, Object> params = new HashMap<>();
			params.put("paymentKey", reqDTO.getPaymentKey());
			params.put("orderId", reqDTO.getOrderId());
			params.put("amount", reqDTO.getAmount());

			// 3. RestTemplate로 POST 요청
			HttpEntity<Map<String, Object>> request = new HttpEntity<>(params, headers);
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<String> response = restTemplate.postForEntity(apiUrl, request, String.class);

			// 4. 응답 코드 200이면 승인 성공
			 if (response.getStatusCode() == HttpStatus.OK) {
		            return true;
		        } else {
		            System.err.println("[Toss 승인 실패] status=" + response.getStatusCode() + ", body=" + response.getBody());
		            return false;
		        }
		} catch (Exception e) {
			e.printStackTrace();
			return false; // 승인 실패 처리
		}	
	}
    
		public List<MyMentosListResponseDTO> selectMyMentosListById(Integer memberId){
			return myPageDAO.selectMyMentosListById(memberId);
		}
		
		public List<MyMatchupListResponseDTO> selectJoinListByMemberId(Integer memberId){		
			return myPageDAO.selectJoinListByMemberId(memberId);
		}
		
		public List<MyPaymentListResponseDTO> selectMyPaymentListById(Integer memberId){
			List<Map<String, Object>> result = mypageMapper.selectMyPaymentListById(memberId);
			List<MyPaymentListResponseDTO> selectMyPaymentList = new ArrayList<MyPaymentListResponseDTO>();
			
			result.stream().forEach(data ->{
			 	MyPaymentListResponseDTO dto = MyPaymentListResponseDTO.builder()
			 	.orderId((String)data.get("ORDERID"))
				.amount(((BigDecimal)data.get("AMOUNT")).intValue())
				.matchupId(((BigDecimal)data.get("MATCHUPID")).intValue())
				.mentosId(((BigDecimal)data.get("MENTOSID")).intValue())
				.keepgoingId(((BigDecimal)data.get("KEEPGOINGID")).intValue())
				.paymentStatus((String)data.get("PAYMENTSTATUS"))
				.matchupTitle(((BigDecimal)data.get("MATCHUPID")).intValue()==0 ? null : (String)data.get("MATCHUPTITLE"))
				.mentosTitle(((BigDecimal)data.get("MENTOSID")).intValue()==0 ? null :(String)data.get("MENTOSTITLE"))
				.keepgoingName(((BigDecimal)data.get("KEEPGOINGID")).intValue()==0 ? null :(String)data.get("KEEPGOINGNAME"))
			 	.build();
			 	
			 	selectMyPaymentList.add(dto);
			});
			
			return selectMyPaymentList;
		}

		public SparkTestResultResponseDTO updateSparkType(SparkTestResultRequestDTO reqDTO, int memberId) {
			
			log.info("[updateSparkType - service]");
			SparkTestType sparkType = reqDTO.getSparkResultType();
			int metchTypeId = mypageMapper.selectMatchTypebyName(sparkType);
			int updateTypeResult = mypageMapper.updateMyTypeByMemberId(metchTypeId,memberId); 
			
			return SparkTestResultResponseDTO.builder()
					.result(updateTypeResult == 1? "success" : "fail")
					.build();
		}
		
		public MyProfileInfoResponseDTO selectMyProfileInfo(Integer memberId){
			List<Map<String, Object>> result = mypageMapper.selectMyProfileInfo(memberId);
			String profileImageUrl = (String)result.get(0).get("PROFILEIMAGEURL");
			String nickName = (String)result.get(0).get("NICKNAME");
			String introduce = (String)result.get(0).get("INTRODUCE");
			String regionGroup = result.get(0).get("REGIONGROUP") == null ? "" : (String)result.get(0).get("REGIONGROUP");
			String regionSubGroup = result.get(0).get("REGIONSUBGROUP") == null ? "" : (String)result.get(0).get("REGIONSUBGROUP");
			String regionDetail = result.get(0).get("REGIONDETAIL") == null ? "" : (String)result.get(0).get("REGIONDETAIL");
			String locationInfo = regionGroup + " " + regionSubGroup + " " + regionDetail;
			String phoneNumber = result.get(0).get("PHONENUMBER") == null ? "" : (String)result.get(0).get("PHONENUMBER");
			String interestNames = result.stream()
				    .map(data -> data.get("INTERESTNAME") == null ? "" : (String) data.get("INTERESTNAME"))
				    .collect(Collectors.joining(" "));
			
			MyProfileInfoResponseDTO dto = MyProfileInfoResponseDTO.builder()
					.profileImgUrl(profileImageUrl)
					.nickName(nickName)
					.introduce(introduce)
					.location(locationInfo)
					.phoneNumber(phoneNumber)
					.interestName(interestNames)
					.build();
			return dto;
			
		}
	
	}
