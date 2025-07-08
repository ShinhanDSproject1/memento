package com.shinhan.memento.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dto.mentos.MentosSidebarDTO;
import com.shinhan.memento.mapper.MemberMentosMapper;
import com.shinhan.memento.mapper.MentosMapper;
import com.shinhan.memento.mapper.MentosSidebarMapper;
import com.shinhan.memento.mapper.ReviewMapper;
import com.shinhan.memento.model.Mentos;

@Service
public class MentosSidebarService {
	@Autowired
	MentosSidebarMapper mentosSidebarMapper;
	
	@Autowired
	MentosMapper mentosMapper;
	
	@Autowired
	MemberMentosMapper memberMentosMapper;
	
	@Autowired
	ReviewMapper reviewMapper;

	public MentosSidebarDTO getSidebarInfo(int mentoId) {
		// mentoId 로 이 사람의 mentosId 리스트 받아오기
		List<Mentos> mentosList =  mentosMapper.findMentoIdListByMentosId(mentoId);
		
		int totalStudent = mentosList.size();
		int totalReview = reviewMapper.countReviewCntByMentoId(mentoId);
		
		return MentosSidebarDTO.builder().mentoName(mentosSidebarMapper.selectMentoName(mentoId))
				.userType(mentosSidebarMapper.selectUserType(mentoId))
				.studentCount(String.valueOf(totalStudent))
				.reviewCount(String.valueOf(totalReview))
				.avgScore(mentosSidebarMapper.selectAvgScore(mentoId))
				.profileImageUrl(mentosSidebarMapper.selectProfileImageUrl(mentoId)).build();
	}
}