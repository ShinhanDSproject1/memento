package com.shinhan.memento.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shinhan.memento.dto.mainpage.PopularLanguageDTO;

@Service
public interface PopularLanguageService {
    List<PopularLanguageDTO> getPopularLanguages();
}
