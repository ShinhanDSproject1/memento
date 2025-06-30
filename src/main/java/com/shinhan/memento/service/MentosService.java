package com.shinhan.memento.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dto.CreateMentosDBDTO;
import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.mapper.MentosMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MentosService {

    @Autowired
    MentosMapper mentosMapper;

    public boolean createMentos(CreateMentosDTO requestDto) {
    	log.info("[MentosService.createMentos]");
    	// 사용자로부터 입력받는 값은 String, 데이터베이스에 저장되어야하는 값은 Date 라서 타입변경
    	Date startDay = Date.valueOf(requestDto.getStartDay());
    	Date endDay = Date.valueOf(requestDto.getEndDay());
    	
    	// 사용자로부터 입력받는 값은 "11:00" 같은 String, 데이터베이스에 저장되어야 하는 값은 Timestamp 라서 타입 변경
    	Timestamp startTime = Timestamp.valueOf(LocalDateTime.of(LocalDate.of(2000, 1,1), LocalTime.parse(requestDto.getStartTime())));
    	Timestamp endTime = Timestamp.valueOf(LocalDateTime.of(LocalDate.of(2000, 1,1), LocalTime.parse(requestDto.getEndTime())));
    	
    	CreateMentosDBDTO createMentosDBDTO = CreateMentosDBDTO.builder()
    			.categoryId(requestDto.getCategoryId())
    			.content(requestDto.getContent())
    			.endDay(endDay)
    			.startDay(startDay)
    			.endTime(endTime)
    			.startTime(startTime)
    			.image(requestDto.getImage())
    			.languageId(requestDto.getLanguageId())
    			.matchTypeFirst(requestDto.getMatchTypeFirst())
    			.matchTypeSecond(requestDto.getMatchTypeSecond())
    			.matchTypeThird(requestDto.getMatchTypeThird())
    			.maxMember(requestDto.getMaxMember())
    			.minMember(requestDto.getMinMember())
    			.price(requestDto.getPrice())
    			.mentoId(requestDto.getMentoId())
    			.title(requestDto.getTitle())
    			.simpleContent(requestDto.getSimpleContent())
    			.selectedDays(requestDto.getSelectedDays())
    			.times(requestDto.getTimes())
    			.regionDetail(requestDto.getRegionDetail())
    			.regionGroup(requestDto.getRegionGroup())
    			.regionSubgroup(requestDto.getRegionSubgroup()).build();
    	
        int result = mentosMapper.createMentos(createMentosDBDTO);
        return result == 1;
    }
}




