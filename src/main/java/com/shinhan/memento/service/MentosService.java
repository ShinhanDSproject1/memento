package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MentosDAO;
import com.shinhan.memento.dto.EditMentosDTO;

@Service
public class MentosService {
	@Autowired
	MentosDAO mentosDAO;

	public boolean updateMentos(EditMentosDTO dto) {
		int updatedRows = mentosDAO.updateMentos(dto);
		return updatedRows > 0;
	}
}
