package com.shinhan.memento.service;

import com.shinhan.memento.dto.MainPageBannerDTO;
import com.shinhan.memento.mapper.MainPageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service 
public class MainPageService {

    @Autowired
    private MainPageMapper mainPageMapper; 

	/* 메인 페이지에 필요한 모든 카운트 값을 조회하여 Map으로 반환 */
    public Map<String, Integer> getMainPageCounts() {
        Map<String, Integer> counts = new HashMap<>();
        
        counts.put("totalMentoringCount", mainPageMapper.selectTotalMentoringCount());
        counts.put("totalActiveCount", mainPageMapper.selectTotalActiveCount());
        counts.put("totalMatchupCount", mainPageMapper.selectTotalMatchupCount());
        
        counts.put("partnerCount", 100); // 예시 고정값
        counts.put("visitorCount", 2500); // 예시 고정값
        
        return counts;
    }
    
    public List<MainPageBannerDTO> getRecentBanners() {
        return mainPageMapper.selectMentosBannerInfo();
    }
    
}