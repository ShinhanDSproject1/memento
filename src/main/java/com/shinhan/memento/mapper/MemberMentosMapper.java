package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.shinhan.memento.dto.JoinMentosDTO;

@Mapper
public interface MemberMentosMapper {
	
	int joinMentos(JoinMentosDTO joinMentosId);
}
