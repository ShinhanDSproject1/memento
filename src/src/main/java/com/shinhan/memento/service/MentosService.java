package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MentosDAO;
import com.shinhan.memento.dto.CreateMentosDTO;

@Service
public class MentosService {

    @Autowired
    MentosDAO mentosDAO;

    public boolean registerMento(CreateMentosDTO dto) {
    	
        int result = mentosDAO.insertMentos(dto);
        return result > 0;
    }
}




