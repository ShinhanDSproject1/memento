package com.shinhan.memento.mapper;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.shinhan.memento.model.Member;

public interface MemberMapper {
	Member findMemberById(int memberId);
	Member findMemberByIdAndUserType(Map<String, Object> params);
}