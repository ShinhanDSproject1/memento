package com.shinhan.memento.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinhan.memento.dto.MainPageBannerDTO;

@Mapper
public interface MainPageMapper {

	/* 멘토링 수강 수를 조회 (mentos + matchup) */
    int selectTotalMentoringCount();
    
	/* 현재 활성화된 매칭 수를 조회 (matchup + mentos + keepgoing) */
    int selectTotalActiveCount();
    
	/* 누적 매치업 수를 조회 */
    int selectTotalMatchupCount();
    
	/* 최신 멘토스 정보를 조회해 배너에 제공 */
    List<MainPageBannerDTO> selectMentosBannerInfo();
}