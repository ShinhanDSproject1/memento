package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CategoryMapper {
    String findCategoryNameById(@Param("categoryId") int categoryId);
}

