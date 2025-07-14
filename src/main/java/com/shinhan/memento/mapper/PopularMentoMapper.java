package com.shinhan.memento.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinhan.memento.dto.mainpage.PopularMentorDTO;

@Mapper
public interface PopularMentoMapper {
    List<PopularMentorDTO> findPopularMentors();
}	
