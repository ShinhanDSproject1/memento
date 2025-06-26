package com.shinhan.memento.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.model.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDAO implements MemberDAOInterface{
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.shinhan.memento.dao.MemberDAOInterface.";
	
	@Override
	public Member selectMemberById(int memberId) {
		log.info("[MemberDAO.selectMemberById]");
		return sqlSession.selectOne(namespace + "selectMemberById", memberId);
	}
}
