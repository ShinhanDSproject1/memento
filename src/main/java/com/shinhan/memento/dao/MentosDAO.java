package com.shinhan.memento.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dto.CreateMentosDTO;



@Repository
public class MentosDAO implements MentosInterfaceDAO {
	@Autowired
    SqlSession session;

    String namespace = "com.shinhan.memento.dao.MentosDAO.";

    @Override
    public int insertMentos(CreateMentosDTO dto) {
        return session.insert(namespace + "insertMentos", dto);
    }
	

}
