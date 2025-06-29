package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MentosDAO;
import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.EditMentosDTO;

@Service
public class MentosService {
	@Autowired
	MentosDAO mentosDAO;

	public DetailMentosDTO getMentosDetail(int mentosId) {
		return mentosDAO.selectMentosDetail(mentosId);
	}

	public boolean registerMento(CreateMentosDTO dto) {
		int result = mentosDAO.insertMentos(dto);
		return result > 0;
	}

	public boolean updateMentos(EditMentosDTO dto) {
		int updatedRows = mentosDAO.updateMentos(dto);
		return updatedRows > 0;
	}

	public boolean deleteMentos(int mentosId) {
		return mentosDAO.deleteMentos(mentosId) > 0;
	}
}
