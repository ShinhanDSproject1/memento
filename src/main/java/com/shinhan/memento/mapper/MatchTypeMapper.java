package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MatchTypeMapper {
	String findMatchTypeById(int matchTypeId);
}
