package com.shinhan.memento.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartMapper {
	Integer checkFavorite(Map<String, Object> favoriteParams);
}
