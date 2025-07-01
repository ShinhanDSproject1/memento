package com.shinhan.memento.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageMapper {
	public abstract List<Map<String, Object>> selectMyPaymentListById(Integer memberId);
}
