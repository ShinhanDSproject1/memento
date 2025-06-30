package com.shinhan.memento.dao;

import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.EditMentosDTO;
import com.shinhan.memento.dto.ReviewSummaryDTO;

public interface MentosInterfaceDAO {
	
	DetailMentosDTO selectMentosDetail(int mentosId);
	
	
	public int insertMentos(CreateMentosDTO dto);

	int updateMentos(EditMentosDTO dto);
	
	int deleteMentos(int mentosId);
}
