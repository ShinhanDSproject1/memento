package com.shinhan.memento.dao;

import java.util.List;

import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.EditMentosDTO;
import com.shinhan.memento.dto.SimilarMentosDTO;

public interface MentosInterfaceDAO {
	
	DetailMentosDTO selectMentosDetail(int mentosId);
	
	List<DetailMentosDTO> findSimilarMentos(SimilarMentosDTO simpleDTO);

	
	public int insertMentos(CreateMentosDTO dto);

	int updateMentos(EditMentosDTO dto);
	
	int deleteMentos(int mentosId);

}
