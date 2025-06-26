package com.shinhan.memento.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.shinhan.memento.dto.MyMatchupListResponseDTO;

@Repository
public class MemberMatchUpDAO implements MemberMatchUpInterface{

	@Autowired
	SqlSession sqlSession;
	String namespace="com.memento.shinhan.mymatchuplist.";
	
	@Override
	public List<MyMatchupListResponseDTO> selectJoinListByMemberId(Integer memberId) {
		List<MyMatchupListResponseDTO> memberMatchUPList = sqlSession.selectList(namespace+"selectMyMatchUpList",memberId);
		return memberMatchUPList;
	}

}
