package com.shinhan.memento.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MentosDAO;
import com.shinhan.memento.dao.ReviewDAO;
import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.EditMentosDTO;
import com.shinhan.memento.dto.ReviewSummaryDTO;
import com.shinhan.memento.dto.SimilarMentosDTO;

@Service
public class MentosService {
	@Autowired
	MentosDAO mentosDAO;

	@Autowired
	ReviewDAO reviewDAO;

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
