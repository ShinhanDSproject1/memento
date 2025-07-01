package com.shinhan.memento.service;

import java.util.List;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MentosDAO;
import com.shinhan.memento.dao.ReviewDAO;
import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.EditMentosDTO;
import com.shinhan.memento.dto.ReviewSummaryDTO;
import com.shinhan.memento.dto.SimilarMentosDTO;
import com.shinhan.memento.dto.CreateMentosDBDTO;
import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.mapper.MentosMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MentosService {

    @Autowired
    MentosMapper mentosMapper;
	@Autowired
	MentosDAO mentosDAO;

	@Autowired
	ReviewDAO reviewDAO;

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

	public DetailMentosDTO getMentosDetail(int mentosId) {

		DetailMentosDTO dto = mentosDAO.selectMentosDetail(mentosId);

		// 2. 리뷰 요약 조회 및 평균 점수 세팅
		ReviewSummaryDTO review = reviewDAO.getMentoReviewSummary(dto.getMentoId());
		dto.setAvgScore(review != null ? review.getAvgScore() : 0.0);

		// 3. 비슷한 멘토스 조회 조건 만들기
		SimilarMentosDTO simpleDTO = new SimilarMentosDTO();
		simpleDTO.setMentosId(dto.getMentosId());
		simpleDTO.setRegionGroup(dto.getRegionGroup());
		simpleDTO.setRegionSubgroup(dto.getRegionSubgroup());
		simpleDTO.setLanguageId(dto.getLanguageId());

		// 4. 유사 멘토스 3개 조회
		List<DetailMentosDTO> similarList = mentosDAO.findSimilarMentos(simpleDTO);

		// 5. 결과 세팅
		dto.setSimilarMentosList(similarList);
		
		return dto;
	}

	public boolean registerMento(CreateMentosDTO dto) {
		int result = mentosDAO.insertMentos(dto);
		return result > 0;
	}

	public boolean updateMentos(EditMentosDTO dto) {
		int updatedRows = mentosDAO.updateMentos(dto);
		return updatedRows > 0;
	}

	public boolean deleteMentos(int mentosId) {
		return mentosDAO.deleteMentos(mentosId) > 0;
	}
}




