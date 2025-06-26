package com.shinhan.memento.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dao.MentosDAO;
import com.shinhan.memento.dto.MentosEntity;
import com.shinhan.memento.dto.mentos.MentosListRequestDTO;

@Repository
public class MentosDAOImpl implements MentosDAO{
	
	 private static final String NAMESPACE = "com.shinhan.memento.dao.MentosDAO.";
	
	    @Autowired
	    SqlSession sqlSession;

	    @Override
	    public List<MentosEntity> selectPreMentos(MentosListRequestDTO reqDTO) {
	    	System.out.println("maaping1");
	        return sqlSession.selectList(NAMESPACE + "selectPreMentos", reqDTO);
	    }

	    @Override
	    public List<MentosEntity> selectMentos(MentosListRequestDTO reqDTO) {
	    	System.out.println("maaping2");
	        return sqlSession.selectList(NAMESPACE + "selectMentos", reqDTO);
	    }

	    @Override
	    public int countTotalPages(MentosListRequestDTO reqDTO) {
	        return sqlSession.selectOne(NAMESPACE + "countTotalPages", reqDTO);
	    }

}
