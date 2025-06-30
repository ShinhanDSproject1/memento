package com.shinhan.memento.dao;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dto.MypageKeepgoingHistoryDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberKeepgoingDAO implements MemberKeepgoingDAOInterface{

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.shinhan.memento.dao.MemberKeepgoingDAOInterface";
	
	@Override
	public List<MypageKeepgoingHistoryDTO> showKeepgoingHistoryByMemberId(int memberId){
		log.info("[MemberKeepgoingDAO.showKeepgoingHistory]");
		//DB에 시간을 LocalDateTime 으로 사용하고 있는데, 서비스에서는 그냥 11:00 이런식으로 보여주고 싶어서 디비에서 받아온 데이터 수정
		List<HashMap<String, Object>> rawList = sqlSession.selectList(namespace + ".showKeepgoingHistoryByMemberId", memberId);
		List<MypageKeepgoingHistoryDTO> result = new ArrayList<>();
		
		rawList.forEach(a->System.out.println(a));
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
		
		for(HashMap<String, Object> rawData : rawList) {
			String startRaw = rawData.get("STARTTIME").toString(); 
			String endRaw = rawData.get("ENDTIME").toString();

			String startFormatted = LocalTime.parse(startRaw.substring(11, 16)).format(DateTimeFormatter.ofPattern("HH:mm"));
			String endFormatted = LocalTime.parse(endRaw.substring(11, 16)).format(DateTimeFormatter.ofPattern("HH:mm"));

			MypageKeepgoingHistoryDTO dto = MypageKeepgoingHistoryDTO.builder()
				.keepgoingId(((BigDecimal)rawData.get("KEEPGOINGID")).intValue())
				.logo((String) rawData.get("LOGO"))
				.name((String) rawData.get("NAME"))
				.selectedDays((String) rawData.get("SELECTEDDAYS"))
				.startTime(startFormatted) // "17:00"
				.endTime(endFormatted)     // "21:00"
				.location((String) rawData.get("LOCATION"))
				.totalCnt(((BigDecimal) rawData.get("TOTALCNT")).intValue())
				.build();

			result.add(dto);
		}
		return result;
	}
}
