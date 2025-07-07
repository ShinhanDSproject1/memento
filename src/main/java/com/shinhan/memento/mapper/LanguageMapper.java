package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface LanguageMapper {
	String findLanguageById(int languageId);
}
