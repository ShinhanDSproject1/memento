package com.shinhan.memento.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shinhan.memento.dto.PopularMentiDTO;
import com.shinhan.memento.mapper.PopularMentiMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PopularMentiServiceImpl implements PopularMentiService {

    private final PopularMentiMapper popularMentiMapper;

    @Override
    public List<PopularMentiDTO> getPopularMenti() {
        return popularMentiMapper.findPopularMenti();
    }
}
