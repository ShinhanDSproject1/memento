package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.shinhan.memento.dto.CreateMentosDBDTO;

@Mapper
public interface MentosMapper {

	int createMentos(CreateMentosDBDTO dto);
}
