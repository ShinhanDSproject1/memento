package com.shinhan.memento.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.dto.PopularLanguageDTO;
import com.shinhan.memento.dto.PopularMentiDTO;
import com.shinhan.memento.dto.PopularMentorDTO;
import com.shinhan.memento.service.PopularMentoService;
import com.shinhan.memento.service.PopularLanguageService;
import com.shinhan.memento.service.PopularMentiService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class MainpageApiController {

    private final PopularMentoService mentorRankingService;
    private final PopularMentiService popularMentiService;
    private final PopularLanguageService popularLanguageService;

    @GetMapping("/popular-mentors")
    public BaseResponse<List<PopularMentorDTO>> getPopularMentors() {
        return new BaseResponse<>(mentorRankingService.getPopularMentors());
    }
    
    @GetMapping("/popular-menti")
    public BaseResponse<List<PopularMentiDTO>> getPopularMenti() {
        return new BaseResponse<>(popularMentiService.getPopularMenti());
    }
    
    @GetMapping("/popular-languages")
    public BaseResponse<List<PopularLanguageDTO>> getPopularLanguages() {
        return new BaseResponse<>(popularLanguageService.getPopularLanguages());
    }
}
