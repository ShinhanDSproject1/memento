package com.shinhan.memento.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.dto.PopularLanguageDTO;
import com.shinhan.memento.dto.PopularMentiDTO;
import com.shinhan.memento.dto.PopularMentorDTO;
import com.shinhan.memento.service.MentorRankingService;
import com.shinhan.memento.service.PopularLanguageService;
import com.shinhan.memento.service.PopularMentiService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MainpageApiController {

    private final MentorRankingService mentorRankingService;
    private final PopularMentiService popularMentiService;
    private final PopularLanguageService popularLanguageService;

    @GetMapping("/api/popular-mentors")
    public List<PopularMentorDTO> getPopularMentors() {
        return mentorRankingService.getPopularMentors();
    }
    
    @GetMapping("/api/popular-menti")
    public List<PopularMentiDTO> getPopularMenti() {
        return popularMentiService.getPopularMenti();
    }
    
    @GetMapping("/api/popular-languages")
    public List<PopularLanguageDTO> getPopularLanguages() {
        return popularLanguageService.getPopularLanguages();
    }
}
