package com.shinhan.memento.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shinhan.memento.dto.PopularMentorDTO;
import com.shinhan.memento.mapper.MentorRankingMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MentorRankingService {

    private final MentorRankingMapper mentorRankingMapper;

    public List<PopularMentorDTO> getPopularMentors() {
        return mentorRankingMapper.findPopularMentors();
    }
}
