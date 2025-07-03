package com.shinhan.memento.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shinhan.memento.model.Review;

@Mapper
public interface ReviewMapper {

	List<Review> getReviewsByMentoIdAfter(Map<String, Object> reviewParams);
}
