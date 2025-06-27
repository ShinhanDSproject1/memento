package com.shinhan.memento.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberMatchUpDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.shinhan.memento.dao.MatchUpDAO.";
	
	/* 삭제된 매치업에 신청 혹은 참여중인 멤버 데이터 삭제하기 */
	public int deleteByMatchupId(int matchupId) {
		return sqlSession.delete(namespace + "deleteMemberMatchupsByMatchupId", matchupId);
	}

}
