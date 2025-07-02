package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MatchTypeMapper {
	String findMatchTypeNameById(@Param("matchTypeId") int matchTypeId);
}
