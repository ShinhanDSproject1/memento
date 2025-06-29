package com.shinhan.memento.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.shinhan.memento.dto.PopularLanguageDTO;
import com.shinhan.memento.mapper.PopularLanguageMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PopularLanguageServiceImpl implements PopularLanguageService {

    private final PopularLanguageMapper mapper;

    @Override
    public List<PopularLanguageDTO> getPopularLanguages() {
        return mapper.findPopularLanguages();
    }
}
