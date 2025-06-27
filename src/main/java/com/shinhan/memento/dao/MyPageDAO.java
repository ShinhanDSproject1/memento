package com.shinhan.memento.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO implements MyPageDAOInterface{
	
	@Autowired
	SqlSession sqlSession;
}
