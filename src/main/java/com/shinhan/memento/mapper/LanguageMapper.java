package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LanguageMapper {
	String findLanguageNameById(@Param("languageId") int languageId);
}