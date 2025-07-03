package com.shinhan.memento.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shinhan.memento.dto.PopularMentorDTO;
import com.shinhan.memento.mapper.PopularMentoMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PopularMentoService {

    private final PopularMentoMapper popularMentoMapper;

    public List<PopularMentorDTO> getPopularMentors() {
        return popularMentoMapper.findPopularMentors();
    }
}
