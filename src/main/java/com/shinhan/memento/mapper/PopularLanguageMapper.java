package com.shinhan.memento.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinhan.memento.dto.mainpage.PopularLanguageDTO;

@Mapper
public interface PopularLanguageMapper {
    List<PopularLanguageDTO> findPopularLanguages();
}