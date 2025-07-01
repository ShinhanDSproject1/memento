package com.shinhan.memento.dao;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.math.BigDecimal;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dto.MyMentosListResponseDTO;

@Repository
public class MyPageDAO implements MyPageDAOInterface{
	
	@Autowired
	SqlSession sqlSession;
	
	String listNameSpace = "com.memento.shinhan.mypagelist.";
	
	@Override
	public List<MyMentosListResponseDTO> selectMyMentosListById(Integer memberId) {
		
		List<HashMap<String, Object>> dataList = sqlSession.selectList(listNameSpace + "selectMyMentosListById", memberId);
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
}
