package com.shinhan.memento.mapper;

import java.util.Map;
import com.shinhan.memento.model.Member;

public interface MemberMapper {
	Member findMemberById(Map<String, Object> params);
}