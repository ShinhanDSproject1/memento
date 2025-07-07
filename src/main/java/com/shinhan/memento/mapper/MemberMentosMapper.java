package com.shinhan.memento.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.shinhan.memento.dto.mentos.JoinMentosDTO;
import com.shinhan.memento.model.MemberMentos;

@Mapper
public interface MemberMentosMapper {
	
	int joinMentos(JoinMentosDTO joinMentosDTO);
	MemberMentos findMemberMentosById(JoinMentosDTO joinMentosDTO);
	int cancelJoinMentos(int memberMentosId);
	int countStudentCntByMentosId(int mentosId);
	void deleteMemberMentos(int mentosId);
}
