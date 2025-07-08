package com.shinhan.memento.dao;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.shinhan.memento.dto.MyMatchupListResponseDTO;
import com.shinhan.memento.dto.MyMentosListResponseDTO;
import com.shinhan.memento.model.CashProduct;
import com.shinhan.memento.model.Payment;
import lombok.extern.slf4j.Slf4j;
import com.shinhan.memento.dto.MyMatchupListResponseDTO;
import com.shinhan.memento.dto.MyMentosListResponseDTO;

@Slf4j
@Repository
public class MyPageDAO implements MyPageDAOInterface{
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.shinhan.memento.mapper.MypageMapper.";
	
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

	@Override
	public List<MyMentosListResponseDTO> selectMyMentosListById(Integer memberId) {
		
		List<HashMap<String, Object>> dataList = sqlSession.selectList(namespace + "selectMyMentosListById", memberId);
		List<MyMentosListResponseDTO> myMentosList = new ArrayList<>();
		
		dataList.stream().forEach(data -> {
			
		    Object reviewStatusObj = data.get("REVIEWSTATUS");
		    String reviewStatus = (reviewStatusObj == null) ? null : (String) reviewStatusObj;
		    Integer reviewId = (data.get("REVIEWID") == null) ? null: ((BigDecimal)data.get("REVIEWID")).intValue();
		    
		    String startRaw = data.get("STARTTIME").toString(); // rawData.get("STARTTIME") 대신 사용
            String endRaw = data.get("ENDTIME").toString();     // rawData.get("ENDTIME") 대신 사용
		    if (startRaw != null && startRaw.length() >= 16) {
		    	startRaw = LocalTime.parse(startRaw.substring(11, 16)).format(DateTimeFormatter.ofPattern("HH:mm"));
            }
		    if (endRaw != null && endRaw.length() >= 16) {
		    	endRaw = LocalTime.parse(endRaw.substring(11, 16)).format(DateTimeFormatter.ofPattern("HH:mm"));
            }
		    
			MyMentosListResponseDTO dto = MyMentosListResponseDTO.builder()
			.mentosId(((BigDecimal)data.get("MENTOSID")).intValue())
			.mentosImg((String)data.get("MENTOSIMG"))
			.mentosTitle((String)data.get("MENTOSTITLE"))
			.regionSubgroup((String)data.get("REGIONSUBGROUP"))
			.startTime(startRaw)
			.endTime(endRaw)
			.selectedDays((String)data.get("SELECTEDDAYS"))
			.mentoNickname((String)data.get("MENTONICKNAME"))
			.mentoUserType((String)data.get("MENTOUSERTYPE"))		
			.status((String)data.get("STATUS"))
			.reviewId(reviewId)
			.reviewStatus(reviewStatus)
			.build();
			
			myMentosList.add(dto);
		});

		return myMentosList;
	}
  
	@Override
	public List<MyMatchupListResponseDTO> selectJoinListByMemberId(Integer memberId) {
		// 1. 결과를 DTO 리스트로 직접 받습니다.
        List<MyMatchupListResponseDTO> memberMatchUPList = sqlSession.selectList(namespace + "selectMyMatchUpList", memberId);

        // 2. DTO 리스트를 순회하며 시간 포맷만 수정합니다.
        for (MyMatchupListResponseDTO dto : memberMatchUPList) {
            // MyBatis가 DTO에 넣어준 기존 시간 값을 getter로 가져옵니다.
            String startRaw = dto.getStartTime(); // rawData.get("STARTTIME") 대신 사용
            String endRaw = dto.getEndTime();     // rawData.get("ENDTIME") 대신 사용

            // 원하시는 포맷으로 변경합니다.
            // (기존 코드에서 이 부분은 에러가 없었으므로 그대로 사용하되, null 체크를 추가하면 더 안전합니다.)
            if (startRaw != null && startRaw.length() >= 16) {
                String startFormatted = LocalTime.parse(startRaw.substring(11, 16)).format(DateTimeFormatter.ofPattern("HH:mm"));
                dto.setStartTime(startFormatted); // setter를 사용해 포맷된 값으로 덮어씁니다.
            }
            if (endRaw != null && endRaw.length() >= 16) {
                String endFormatted = LocalTime.parse(endRaw.substring(11, 16)).format(DateTimeFormatter.ofPattern("HH:mm"));
                dto.setEndTime(endFormatted);     // setter를 사용해 포맷된 값으로 덮어씁니다.
            }
            dto.setMatchupCount(0);
        }

        return memberMatchUPList;
	}
}
