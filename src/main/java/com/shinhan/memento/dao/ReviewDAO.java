package com.shinhan.memento.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dto.ReviewSummaryDTO;

@Repository
public class ReviewDAO implements ReviewInterfaceDAO {

    @Autowired
    SqlSession session;

    String namespace = "com.shinhan.memento.dao.ReviewDAO.";

    @Override
    public ReviewSummaryDTO getMentoReviewSummary(int mentoId) {
    	System.out.println("----param:" + mentoId);
    	ReviewSummaryDTO dto = session.selectOne(namespace + "getMentoReviewSummary", mentoId);
     
       System.out.println(dto);
    	return dto;
    }
}
