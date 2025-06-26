package com.shinhan.memento.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MentosDAO;
import com.shinhan.memento.dao.impl.MentosDAOImpl;
import com.shinhan.memento.dto.MentosEntity;
import com.shinhan.memento.dto.mentos.MentosItemDTO;
import com.shinhan.memento.dto.mentos.MentosListRequestDTO;
import com.shinhan.memento.dto.mentos.MentosListResponseDTO;

import lombok.AllArgsConstructor;

@Service
public class MentosService {
	
	@Autowired
		MentosDAO mentosDAO;
	
	public MentosListResponseDTO getMentos(MentosListRequestDTO reqDTO) {
       
	    int page = reqDTO.getPage() == null ? 1 : Integer.parseInt(reqDTO.getPage());
	    int totalPages = 10;
	    reqDTO.setStartRow((page - 1) * totalPages + 1);
	    reqDTO.setEndRow(page * totalPages);
	    
		
		List<MentosEntity> mentosEntityList = mentosDAO.selectMentos(reqDTO);
        List<MentosEntity> preMentosEntityList = mentosDAO.selectPreMentos(reqDTO);
        
        
        List<MentosItemDTO> mentos = 
        		mentosEntityList.stream()
        	    .map(this::entityToDto)
        		.collect(Collectors.toList());

        List<MentosItemDTO> preMentos = 
        		preMentosEntityList.stream()
        		.map(this::entityToDto)
        		.collect(Collectors.toList());
     
        return MentosListResponseDTO.builder()
                .page(page)
                .totalPages(totalPages)
                .preMentos(preMentos)
                .mentos(mentos)
                .build();
    }
	
	// 변환 메서드 예시
	private MentosItemDTO entityToDto(MentosEntity entity) {
	    return MentosItemDTO.builder()
	        .title(entity.getTitle())
	        .name("멘토명 예시") // 필요시 가공
	        .startDate(entity.getStart_day() == null ? null : entity.getStart_day().toString())
	        .endDate(entity.getEnd_day() == null ? null : entity.getEnd_day().toString())
	        .startTime(entity.getStart_time() == null ? null : entity.getStart_time().toLocalDateTime().getHour())
	        .endTime(entity.getEmd_time() == null ? null : entity.getEmd_time().toLocalDateTime().getHour())
	        .seletedDate(parseSelectedDate(entity.getContent()))
	        .location(entity.getRegion_detail())
	        .price(entity.getPrice())
	        .decisionCount(entity.getTimes())
	        .build();
	}
	
	private List<String> parseSelectedDate(String raw) {
	    if (raw == null || raw.trim().isEmpty()) return List.of();
	    return Arrays.stream(raw.split(","))
	            .map(String::trim)
	            .filter(s -> !s.isEmpty())
	            .collect(Collectors.toList());
	}
}
